import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:meta/meta.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit() : super(ResetpasswordInitial());

  static ResetpasswordCubit get(context) => BlocProvider.of(context);

Future<void> resetPassword({
  required String newPassword,
  required String token,  
}) async {
  emit(ResetpasswordLoading());

  try {
    final response = await DioHelper.resetPassword({
      'newPassword': newPassword,
    }, token);  

    emit(ResetpasswordSuccess(response.data));
  } catch (e) {
    emit(ResetpasswordFailure(e.toString()));
  }
}

}
