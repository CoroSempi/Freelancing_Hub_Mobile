import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/job_details_model.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  static DetailsCubit get(context) => BlocProvider.of(context);

  void fetchJobDetails(String jobId) async {
    emit(DetailsLoading());
    try {
      final response = await DioHelper.getJobDetails(jobId);
      final jobDetailsResponse = JobDetailsResponse.fromJson(response.data);
      final jobData = jobDetailsResponse.jobData;
      final canEdit = jobDetailsResponse.canEdit;

      emit(DetailsLoaded(jobData, canEdit));
    } catch (e) {
      emit(DetailsError(e.toString()));
    }
  }

  void deleteJob(String jobId, String jobType) async {
    try {
      await DioHelper.deleteJob(jobId, jobType);
      emit(JobDeletedSuccess());
    } catch (e) {
      emit(JobDeletedError(e.toString()));
    }
  }
}
