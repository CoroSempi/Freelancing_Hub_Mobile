part of 'getstudentdata_cubit.dart';

@immutable
sealed class GetstudentdataState {}

final class GetstudentdataInitial extends GetstudentdataState {}

final class GetstudentdataLoading extends GetstudentdataState {}


final class GetstudentdataSuccess extends GetstudentdataState {
  final StudentModel studentData;
  GetstudentdataSuccess(this.studentData);
}


final class GetstudentdataFailure extends GetstudentdataState {
  final String error;
  GetstudentdataFailure(this.error);
}
