part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}


 

class LoginLoading extends LoginCubitState {}

class LoginSuccess extends LoginCubitState {
  final LoginResponse loginResponse;

  LoginSuccess(this.loginResponse);
}

class LoginFailure extends LoginCubitState {
  final String error;

  LoginFailure(this.error);
}