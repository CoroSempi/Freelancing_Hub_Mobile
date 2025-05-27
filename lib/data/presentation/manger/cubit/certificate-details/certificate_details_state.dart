part of 'certificate_details_cubit.dart';

sealed class CertificateDetailsState extends Equatable {
  const CertificateDetailsState();

  @override
  List<Object> get props => [];
}

final class CertificateDetailsInitial extends CertificateDetailsState {}

final class CertificateDetailsLoading extends CertificateDetailsState {}

final class CertificateDetailsSuccess extends CertificateDetailsState {
  final CertificateModel certificate;
  const CertificateDetailsSuccess(this.certificate);

  @override
  List<Object> get props => [certificate];
}

final class CertificateDeletedSuccess extends CertificateDetailsState {}

final class CertificateDetailsError extends CertificateDetailsState {
  final String error;
  const CertificateDetailsError(this.error);

  @override
  List<Object> get props => [error];
}
