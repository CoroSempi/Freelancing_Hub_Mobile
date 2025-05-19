part of 'forgetpassword_cubit.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

final class ForgetpasswordLoading extends ForgetpasswordState {}


final class ForgetpasswordSuccess extends ForgetpasswordState { 

  final String message ;

   ForgetpasswordSuccess(this.message);
}



final class ForgetpasswordFailure extends ForgetpasswordState {
  final String error;
  ForgetpasswordFailure(this.error);
}
