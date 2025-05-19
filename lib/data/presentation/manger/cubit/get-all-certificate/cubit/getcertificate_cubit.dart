import 'package:bloc/bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:iti_freelancing_hub/data/models/certificationModel.dart';
import 'package:meta/meta.dart';

part 'getcertificate_state.dart';

class GetcertificateCubit extends Cubit<GetcertificateState> {
  GetcertificateCubit() : super(GetcertificateInitial());


  List<CertificateData> certificates = [];
  Future<void> getCertificate() async {
emit(GetcertificateLoading());
try {
  final response = await DioHelper.getAllCertificates();
   
          certificates = (response.data as List<dynamic>)
            .map((certifidata) => CertificateData.fromJson(certifidata))
            .toList();

   emit(GetcertificateSuccess(certificates));
} catch (e) {
  emit(GetcertificateFailure(e.toString()));
}


  }


}
