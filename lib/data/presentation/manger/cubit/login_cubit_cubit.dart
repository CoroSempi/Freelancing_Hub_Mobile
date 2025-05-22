import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/login-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());
  static LoginCubitCubit get(context) => BlocProvider.of(context);

  bool isHidePassword = true;
  IconData passwordIcon = Icons.visibility_outlined;
  LoginResponse? user;

  void changePassword() {
    isHidePassword = !isHidePassword;
    passwordIcon =
        isHidePassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined;
    emit(ChangePassword());
  }

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final response = await DioHelper.login({
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        if (response.data['message'] != null) {
          emit(LoginFailure(response.data['message']));
          // print(response.data['message']);
        } else {
          final loginResponse = LoginResponse.fromJson(response.data);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('AccessToken', loginResponse.accessToken);
          await prefs.setString(
            'studentData',
            loginResponseToJson(loginResponse),
          );
          user = loginResponse;
          emit(LoginSuccess(loginResponse));
        }
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear(); 
  user = null; 
  isHidePassword = true;
  passwordIcon = Icons.visibility_outlined;
  emit(LoginCubitInitial()); 
}

}
