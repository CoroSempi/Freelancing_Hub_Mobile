import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_home.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/text_field.dart';
import 'package:provider/provider.dart';

import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';

import 'package:iti_freelancing_hub/data/presentation/manger/cubit/add_certificate/add_certificate_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/add_certificate/add_certificate_state.dart';

import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/form-field.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/formFieldWithDropdown.dart';

class AddCertificate extends StatefulWidget {
  final Map<String, dynamic>? certificate;

  const AddCertificate({Key? key, this.certificate}) : super(key: key);

  static const routeName = '/add-certificate';

  @override
  State<AddCertificate> createState() => _AddCertificateState();
}

class _AddCertificateState extends State<AddCertificate> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController certIdController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController proofController = TextEditingController();

  String? courseApproach;
  bool isSubmitEnabled = false;

  bool isEditMode = false;
  String? editingCertificateId;

  @override
  void initState() {
    super.initState();
    certIdController.addListener(_checkFormValid);
    descriptionController.addListener(_checkFormValid);
    startDateController.addListener(_checkFormValid);
    endDateController.addListener(_checkFormValid);
    companyNameController.addListener(_checkFormValid);
    proofController.addListener(_checkFormValid);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.certificate != null) {
      final certificate = widget.certificate!;
      isEditMode = true;
      editingCertificateId = certificate['_id'];
      certIdController.text = certificate['certificateId'] ?? '';
      descriptionController.text = certificate['certificateDescription'] ?? '';
      startDateController.text = certificate['startDate'] ?? '';
      endDateController.text = certificate['endDate'] ?? '';
      companyNameController.text = certificate['Company'] ?? '';
      proofController.text = certificate['proofOfCertificate'] ?? '';
      courseApproach = certificate['approach'];
    }
  }

  @override
  void dispose() {
    certIdController.dispose();
    descriptionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    companyNameController.dispose();
    proofController.dispose();
    super.dispose();
  }

  void _checkFormValid() {
    final isValid =
        certIdController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty &&
        companyNameController.text.isNotEmpty &&
        proofController.text.isNotEmpty &&
        courseApproach != null &&
        courseApproach!.isNotEmpty;

    if (isSubmitEnabled != isValid) {
      setState(() {
        isSubmitEnabled = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return MainScaffold(
      body: BlocProvider(
        create: (_) => AddCertificateCubit(),
        child: BlocConsumer<AddCertificateCubit, AddCertificateState>(
          listener: (context, state) {
            if (state is AddCertificateSuccess) {
              showDialog(
                context: context,
                builder:
                    (ctx) => AlertDialog(
                      title: Text(
                        isEditMode
                            ? 'Certificate Updated Successfully!'
                            : 'Certificate Added Successfully!',
                        style: TextStyles.grey12Medium.copyWith(
                          fontSize: 16,
                          color:
                              settingsProvider.isDark
                                  ? Colors.white
                                  : Colors.grey,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isEditMode
                                ? "Your certificate has been updated."
                                : "Your certificate has been added. You can view it from your profile.",
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          SvgPicture.asset(Assets.assetsImagesTrue, height: 80),
                        ],
                      ),
                      actions: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomeHome(),
                                ),
                                (route) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  settingsProvider.isDark
                                      ? kColors[0]
                                      : Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Back',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
              );
            } else if (state is AddCertificateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.error}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEditMode ? 'Edit Certificate' : 'Add New Certificate',
                      style: TextStyles.black15Medium.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            settingsProvider.isDark
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    settingsProvider.isDark
                        ? SvgPicture.asset(Assets.assetsAddCertDark)
                        : SvgPicture.asset(Assets.assetsAddCertLigth),
                    SizedBox(height: 16.h),

                    _buildLabel('Certificate ID', settingsProvider),
                    CustomTextFiled(
                      controller: certIdController,
                      hittext: 'Certificate ID',
                    ),
                    _buildHint('Ensure that the Certificate ID is Right.'),

                    _buildLabel('Certificate Description', settingsProvider),
                    CustomTextFiled(
                      controller: descriptionController,
                      hittext: 'Certificate Description',
                    ),
                    _buildHint(
                      'Ensure that the description clearly describes the certificate.',
                    ),

                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _buildLabel('Start Date', settingsProvider),
                              CustomTextFiled(
                                controller: startDateController,
                                hittext: 'dd/mm/yyyy',
                                suffixIcon: const Icon(
                                  Icons.date_range_outlined,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (picked != null) {
                                    startDateController.text =
                                        "${picked.year}-${picked.month}-${picked.day}";
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            children: [
                              _buildLabel('End Date', settingsProvider),
                              CustomTextFiled(
                                controller: endDateController,
                                hittext: 'dd/mm/yyy',
                                suffixIcon: const Icon(
                                  Icons.date_range_outlined,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    barrierColor: kColors[5],
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (picked != null) {
                                    endDateController.text =
                                        "${picked.year}-${picked.month}-${picked.day}";
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    _buildLabel('Company Name', settingsProvider),
                    CustomTextFiled(
                      controller: companyNameController,
                      hittext: 'Company Name',
                    ),
                    _buildHint('Ensure that the Company Name is Right.'),

                    SizedBox(height: 24.h),

                    FormFieldWithDropdown(
                      title: 'Course Approach',
                      subtitle: '(Required)',
                      dropDownText: courseApproach,
                      items: ['Online', 'Offline', 'Both'],
                      onChanged: (value) {
                        setState(() {
                          courseApproach = value;
                        });
                        _checkFormValid();
                      },
                      backgroundColor: kColors[0],
                    ),

                    SizedBox(height: 16.h),

                    _buildLabel('Proof of Certificate', settingsProvider),
                    CustomTextFiled(
                      controller: proofController,
                      hittext: 'Proof of Certificate',
                    ),
                    _buildHint(
                      'Ensure that the Proof of Certificate is Right.',
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      'Upload a scanned copy or a photo of the certificate as a single PDF to Google Drive, make the link shareable, and paste it here.',
                      style: TextStyles.grey12Medium.copyWith(fontSize: 14),
                    ),

                    SizedBox(height: 8.h),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Back'),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: CustomButtonWidget(
                            text:
                                state is AddCertificateLoading
                                    ? 'Submitting...'
                                    : (isEditMode ? 'Update' : 'Submit'),
                            onPressed:
                                isSubmitEnabled &&
                                        state is! AddCertificateLoading
                                    ? () {
                                      if (_formKey.currentState!.validate()) {
                                        final data = {
                                          "certificateId":
                                              certIdController.text.trim(),
                                          "certificateDescription":
                                              descriptionController.text.trim(),
                                          "startDate":
                                              startDateController.text.trim(),
                                          "endDate":
                                              endDateController.text.trim(),
                                          "Company":
                                              companyNameController.text.trim(),
                                          "proofOfCertificate":
                                              proofController.text.trim(),
                                          "approach": courseApproach,
                                        };

                                        if (isEditMode &&
                                            editingCertificateId != null) {
                                          context
                                              .read<AddCertificateCubit>()
                                              .updateCertificate(
                                                editingCertificateId!,
                                                data,
                                              );
                                        } else {
                                          context
                                              .read<AddCertificateCubit>()
                                              .addCertificate(data);
                                        }
                                      }
                                    }
                                    : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLabel(String text, SettingsProvider settingsProvider) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyles.black10SemiBold.copyWith(
            fontSize: 14,
            color: settingsProvider.isDark ? Colors.white : Colors.black,
          ),
        ),
        const Text(
          ' (Required)',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildHint(String hint) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 16.h),
      child: Text(hint, style: TextStyles.grey12Medium.copyWith(fontSize: 12)),
    );
  }
}
