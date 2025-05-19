import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';
import 'package:meta/meta.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());
  static ForgetpasswordCubit get(context) => BlocProvider.of(context);

 Future<void> forgetPassword(String email) async {
   emit(ForgetpasswordLoading());
   try {
     final response = await DioHelper.forgetPassword({'email': email});
    final message = response.data['message'];  

    emit(ForgetpasswordSuccess(message));  
    
     } catch (e) {
     emit(ForgetpasswordFailure(e.toString()));
   }
 }




}
