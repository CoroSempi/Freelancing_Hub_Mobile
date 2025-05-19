import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iti_freelancing_hub/core/utils/remote/Dio-Helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  String? avatarUrl;

  ProfileCubit() : super(ProfileInitial());

  Future<void> loadUserProfile() async {
    emit(ProfileLoading());
    try {
      final response = await DioHelper.getStudentData();
      avatarUrl = response.data['avatar'];
      emit(ProfileLoaded(avatarUrl!));
    } catch (e) {
      emit(ProfileError("Failed to load image"));
    }
  }

  Future<void> changeAvatar(String imagePath) async {
    emit(ProfileLoading());

    try {
      final response = await DioHelper.changeAvatar(imagePath);

      print('ChangeAvatar response data: ${response.data}');
      print('ChangeAvatar status code: ${response.statusCode}');

      if (response.statusCode == 200 &&
          response.data['message'] == 'Avatar changed successfully') {
        final userDataResponse = await DioHelper.getStudentData();
        avatarUrl = userDataResponse.data['avatar'];

        emit(ProfileAvatarUpdated(avatarUrl ?? ''));
      } else {
        emit(ProfileError("Failed to update avatar."));
      }
    } catch (e) {
      emit(ProfileError("Failed to update avatar: $e"));
    }
  }
}
