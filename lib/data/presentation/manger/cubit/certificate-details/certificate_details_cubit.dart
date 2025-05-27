import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/certificate_details_model.dart';

part 'certificate_details_state.dart';

class CertificateDetailsCubit extends Cubit<CertificateDetailsState> {
  CertificateDetailsCubit() : super(CertificateDetailsInitial());

  Future<void> getCertificateDetails(String id) async {
    emit(CertificateDetailsLoading());
    try {
      final response = await DioHelper.getCertificateDetails(id);
      final certificate = CertificateModel.fromJson(response.data);
      emit(CertificateDetailsSuccess(certificate));
    } catch (e) {
      emit(CertificateDetailsError(e.toString()));
    }
  }

  Future<void> deleteCertificate(String certificateId) async {
    emit(CertificateDetailsLoading());
    try {
      await DioHelper.deleteCertificate(certificateId);
      emit(CertificateDeletedSuccess());
    } catch (e) {
      emit(CertificateDetailsError(e.toString()));
    }
  }
}
