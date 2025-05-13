import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/login-model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    print('LoginLoading');

    try {
      final response = await DioHelper.login({
        'email': email,
        'password': password,
      });

      final loginResponse = LoginResponse.fromJson(response.data);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', loginResponse.accessToken);

      emit(LoginSuccess(loginResponse));
      print('success');
    } catch (e) {
      print(e.toString());
      emit(LoginFailure(e.toString()));
    }
  }
}
