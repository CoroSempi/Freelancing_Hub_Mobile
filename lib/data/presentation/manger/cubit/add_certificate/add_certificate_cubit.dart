import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/add_certificate/add_certificate_state.dart';

class AddCertificateCubit extends Cubit<AddCertificateState> {
  AddCertificateCubit() : super(AddCertificateInitial());

  Future<void> addCertificate(Map<String, dynamic> certificateData) async {
    emit(AddCertificateLoading());
    try {
      final response = await DioHelper.addCertificate(certificateData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final certificateId = response.data['certificateID'];
        print('add');
        print(response.data);
        emit(AddCertificateSuccess(certificateId));
      } else {
        emit(
          AddCertificateFailure(
            'Failed with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(AddCertificateFailure(e.toString()));
    }
  }

  Future<void> updateCertificate(
    String id,
    Map<String, dynamic> certificateData,
  ) async {
    emit(AddCertificateLoading());

    print("Updating certificate with ID: $id");
    print("Data: $certificateData");

    try {
      final response = await DioHelper.updateCertificate(id, certificateData);

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        emit(AddCertificateSuccess(id));
      } else {
        emit(
          AddCertificateFailure(
            'Failed with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(AddCertificateFailure(e.toString()));
    }
  }
}
