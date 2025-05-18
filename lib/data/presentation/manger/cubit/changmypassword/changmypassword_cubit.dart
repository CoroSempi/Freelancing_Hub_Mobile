import 'package:bloc/bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/changmypassword/changmypassword_state.dart';


class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());

    try {
      final response = await DioHelper.changeMyPassword({
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      });

      final message = response.data['message'] ?? 'Password changed';
      emit(ChangePasswordSuccess(message));
    } catch (e) {
      emit(ChangePasswordError(e.toString()));
    }
  }
}
