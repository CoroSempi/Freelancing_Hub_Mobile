import 'package:equatable/equatable.dart';

abstract class RemotjobState extends Equatable {
  const RemotjobState();

  @override
  List<Object> get props => [];
}

class RemotjobInitial extends RemotjobState {}

class RemotjobLoading extends RemotjobState {}

class RemotjobSuccess extends RemotjobState {
  final String jobId;

  const RemotjobSuccess(this.jobId);

  @override
  List<Object> get props => [jobId];
}

class RemotjobFailure extends RemotjobState {
  final String error;

  const RemotjobFailure(this.error);

  @override
  List<Object> get props => [error];
}
