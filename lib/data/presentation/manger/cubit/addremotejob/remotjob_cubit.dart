import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'remotjob_state.dart';

class RemotjobCubit extends Cubit<RemotjobState> {
  RemotjobCubit() : super(RemotjobInitial());

  Future<void> addRemoteJob(Map<String, dynamic> jobData) async {
    emit(RemotjobLoading());

    try {
      print('Job Data: $jobData');

      final response = await DioHelper.addRemoteJob(jobData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jobID = response.data['jobID'];
        print('add ');
        print(response.data);

        emit(RemotjobSuccess(jobID));
      } else {
        print('error');
        emit(RemotjobFailure(response.data['message'] ?? 'Unknown error'));
      }
    } catch (e) {
      print(RemotjobFailure(e.toString()));
      emit(RemotjobFailure(e.toString()));
    }
  }

  Future<void> updateRemoteJob(String id, Map<String, dynamic> jobData) async {
    emit(RemotjobLoading());

    try {
      print('Update Job ID: $id with data: $jobData');

      final response = await DioHelper.updateRemoteJob(id, jobData);

      if (response.statusCode == 200) {
        print('update success');
        emit(RemotjobSuccess(id));
      } else {
        print('update error');
        emit(RemotjobFailure(response.data['message'] ?? 'Unknown error'));
      }
    } catch (e) {
      print(RemotjobFailure(e.toString()));
      emit(RemotjobFailure(e.toString()));
    }
  }
}
