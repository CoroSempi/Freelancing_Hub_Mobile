import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'verifycode_state.dart';

class VerifycodeCubit extends Cubit<VerifycodeState> {
  VerifycodeCubit() : super(VerifycodeInitial());

  static VerifycodeCubit get(context) => BlocProvider.of(context);

  String? verifyToken;  

  Future<void> verifyCode(String email, String code) async {
    emit(VerifycodeLoading());
    try {
      final response = await DioHelper.verifyCode({
        'email': email,
        'code': code,
      });

      final token = response.data['AccessToken'];

      if (token != null) {
        verifyToken = token;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('AccessToken', token);

        emit(VerifycodeSuccess());
      }  
    } catch (e) {
      emit(VerifycodeFailure('Failed to verify code: ${e.toString()}'));
    }
  }
}
