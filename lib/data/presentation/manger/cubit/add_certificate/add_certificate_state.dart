import 'package:equatable/equatable.dart';

abstract class AddCertificateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddCertificateInitial extends AddCertificateState {}

class AddCertificateLoading extends AddCertificateState {}

class AddCertificateSuccess extends AddCertificateState {
  final String certificateId;

  AddCertificateSuccess(this.certificateId);

  @override
  List<Object?> get props => [certificateId];
}

class AddCertificateFailure extends AddCertificateState {
  final String error;

  AddCertificateFailure(this.error);

  @override
  List<Object?> get props => [error];
}
