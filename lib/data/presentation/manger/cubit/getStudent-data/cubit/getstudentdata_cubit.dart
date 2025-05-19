import 'package:bloc/bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/student_model.dart';
 import 'package:meta/meta.dart';

part 'getstudentdata_state.dart';

class GetstudentdataCubit extends Cubit<GetstudentdataState> {
  GetstudentdataCubit() : super(GetstudentdataInitial());
     StudentModel? userModel;
  Future<void> getStudentData() async {
    emit(GetstudentdataLoading());
    try {
      final response = await DioHelper.getStudentData();
       userModel= StudentModel.fromJson(response.data);
       emit(GetstudentdataSuccess(userModel!));
     } catch (e) {
       emit(GetstudentdataFailure(e.toString()));
    }
  }
}
