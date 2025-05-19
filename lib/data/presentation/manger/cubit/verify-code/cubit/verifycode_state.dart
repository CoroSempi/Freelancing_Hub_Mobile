part of 'verifycode_cubit.dart';

@immutable
sealed class VerifycodeState {}

final class VerifycodeInitial extends VerifycodeState {}

final class VerifycodeLoading extends VerifycodeState {}

final class VerifycodeSuccess extends VerifycodeState {
   VerifycodeSuccess();
}


final class VerifycodeFailure extends VerifycodeState 
{
  final String error;
  VerifycodeFailure(this.error);
}
