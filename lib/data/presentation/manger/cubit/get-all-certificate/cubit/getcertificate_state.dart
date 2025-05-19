part of 'getcertificate_cubit.dart';

@immutable
sealed class GetcertificateState {}

final class GetcertificateInitial extends GetcertificateState {}

final class GetcertificateLoading extends GetcertificateState {}

final class GetcertificateSuccess extends GetcertificateState {

  final List<CertificateData> data;
      GetcertificateSuccess( this.data);
}

final class GetcertificateFailure extends GetcertificateState {
  final String error;
  GetcertificateFailure(this.error);
}
