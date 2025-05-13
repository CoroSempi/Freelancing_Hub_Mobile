// student_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/student_model.dart';
import 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

  // ✅ ممكن تستدعيها في HomeScreen مثلا عشان تجيب بيانات الطالب
  Future<void> getStudentProfile() async {
    emit(StudentLoading());
    try {
      final response = await DioHelper.dio.get(
        'students/profile',
      ); // ✅ لو عندك endpoint مختلف غيره هنا
      final student = StudentModel.fromJson(response.data);
      emit(StudentLoaded(student));
    } on DioException catch (e) {
      emit(
        StudentError(
          e.response?.data["message"] ??
              e.message ??
              "An unexpected error occurred",
        ),
      );
    } catch (e) {
      emit(StudentError(e.toString()));
    }
  }
}
