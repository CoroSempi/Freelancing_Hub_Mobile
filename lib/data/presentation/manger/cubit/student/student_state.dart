

import 'package:equatable/equatable.dart';
import 'package:iti_freelancing_hub/data/models/student_model.dart';

abstract class StudentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  final StudentModel student;

  StudentLoaded(this.student);

  @override
  List<Object?> get props => [student];
}

class StudentError extends StudentState {
  final String message;

  StudentError(this.message);

  @override
  List<Object?> get props => [message];
}