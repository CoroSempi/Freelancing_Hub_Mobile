part of 'getalljobs_cubit.dart';

@immutable
sealed class GetalljobsState {}

final class GetalljobsInitial extends GetalljobsState {}


final class GetalljobsLoading extends GetalljobsState {}


final class GetalljobsSuccess extends GetalljobsState {
   final List<JobData> jobs;   
     GetalljobsSuccess(this.jobs);
}


final class GetalljobsFailure extends GetalljobsState {
  final String error;
  GetalljobsFailure(this.error);
}
