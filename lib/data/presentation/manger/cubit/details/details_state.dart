part of 'details_cubit.dart';


abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final JobDetails jobDetails;
  final bool canEdit;

  const DetailsLoaded(this.jobDetails, this.canEdit);

  @override
  List<Object> get props => [jobDetails, canEdit];
}

class JobDeletedSuccess extends DetailsState {}

class JobDeletedError extends DetailsState {
  final String message;

  const JobDeletedError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailsError extends DetailsState {
  final String message;

  const DetailsError(this.message);

  @override
  List<Object> get props => [message];
}