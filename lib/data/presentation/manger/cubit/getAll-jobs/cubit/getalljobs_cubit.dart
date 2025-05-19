import 'package:bloc/bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/local/cashHelper.dart';
import 'package:iti_freelancing_hub/data/models/jobModel.dart';
import 'package:iti_freelancing_hub/data/models/login-model.dart';
import 'package:meta/meta.dart';

part 'getalljobs_state.dart';

class GetalljobsCubit extends Cubit<GetalljobsState> {
  GetalljobsCubit() : super(GetalljobsInitial());

List<JobData> jobs = [];

Future<void> getAllJobs() async {
  emit(GetalljobsLoading());
  try {
    final response = await DioHelper.getAllJobs();
     if (response.data != null && response.data.isNotEmpty) {
   jobs = (response.data as List<dynamic>)
    .map((item) => JobData.fromJson(item['jobData']))
    .toList();

       emit(GetalljobsSuccess(jobs)); 
    } else {
      emit(GetalljobsFailure('No jobs found'));
    }
  } catch (e) {
     emit(GetalljobsFailure(e.toString()));
  }
}


  String? studentData;
  LoginResponse? loginResponse;
  Future<void> getDataPreference() async {
    studentData = await CashHelper.getData(key: 'studentData');
    loginResponse = loginResponseFromJson(studentData!);
    print("studentData: $studentData");
  }
}
