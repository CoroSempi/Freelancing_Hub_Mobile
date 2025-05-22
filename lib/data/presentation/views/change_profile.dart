import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/profile/profile_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_Buttom.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';

class ChangeProfile extends StatefulWidget {
  final Widget image;
  final String userId;

  static const routeName = '/changeprofile';

  const ChangeProfile({super.key, required this.image, required this.userId});

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadUserProfile();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });

      await context.read<ProfileCubit>().changeAvatar(_image!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kColors[0],
              content: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        if (state is ProfileAvatarUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Updated successfully!',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
          setState(() {
            _image = null;
          });
        }
      },
      builder: (context, state) {
        final profileCubit = context.read<ProfileCubit>();

        String? avatarUrl;

        if (state is ProfileLoaded) {
          avatarUrl = state.avatarUrl;
        } else if (state is ProfileAvatarUpdated) {
          avatarUrl = state.avatarUrl;
        } else if (profileCubit.avatarUrl != null) {
          avatarUrl = profileCubit.avatarUrl;
        }

        return MainScaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomAppBar(
                      backText: 'Back',
                      onBackPressed: () => Navigator.pop(context),
                      showPendingButton: false,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text(
                          'Edit My Profile',
                          style: TextStyles.black20SemiBold.copyWith(
                            color:
                                settingsProvider.isDark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Stack(
                      children: [
                        ClipOval(
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child:
                                _image != null
                                    ? Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.cover,
                                    )
                                    : avatarUrl != null
                                    ? _buildImageFromUrl(avatarUrl)
                                    : widget.image,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 4,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: kColors[0],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.h),
                    Text(
                      "Your personal information is based on what you registered during the training. If you need to update any of this information, please contact the admin for assistance.",
                      style: TextStyles.grey12Medium.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 28.h),
                    CustomButtoms(
                      text: 'Submit',
                      color:
                          settingsProvider.isDark ? kColors[0] : Colors.black,
                      textcolor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                ),
              ),
              if (state is ProfileLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: CircularProgressIndicator(color: kColors[0]),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageFromUrl(String url) {
    if (url.startsWith('data:image')) {
      try {
        final decoded = _decodeBase64Image(url);
        return Image.memory(decoded, fit: BoxFit.cover);
      } catch (e) {
        return Icon(Icons.error, color: kColors[0]);
      }
    } else {
      return Image.network(url, fit: BoxFit.cover);
    }
  }

  Uint8List _decodeBase64Image(String dataUrl) {
    final base64Str = dataUrl.split(',').last;
    return base64Decode(base64Str);
  }
}
