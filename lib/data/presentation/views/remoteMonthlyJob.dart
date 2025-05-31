import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/addremotejob/remotjob_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/addremotejob/remotjob_state.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_home.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/formFieldWithDropdown.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/text_field.dart';

class Remotemonthlyjob extends StatefulWidget {
  final Map<String, dynamic>? existingJobData;
  final String? jobId;

  const Remotemonthlyjob({super.key, this.existingJobData, this.jobId});

  @override
  State<Remotemonthlyjob> createState() => _RemotemonthlyjobState();
}

class _RemotemonthlyjobState extends State<Remotemonthlyjob> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobDescriptionController =
      TextEditingController();
  final TextEditingController costUSDController = TextEditingController();
  final TextEditingController costEGPController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyContactController =
      TextEditingController();
  final TextEditingController proofOfWorkController = TextEditingController();

  String? courseApproach;

  final List<String> worldCountries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo (Congo-Brazzaville)',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czechia (Czech Republic)',
    'Democratic Republic of the Congo',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini (fmr. "Swaziland")',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Holy See',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar (formerly Burma)',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Korea',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestine State',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Korea',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States of America',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];

  @override
  void initState() {
    super.initState();

    if (widget.existingJobData != null) {
      final data = widget.existingJobData!;
      jobTitleController.text = data['jobTitle'] ?? '';
      jobDescriptionController.text = data['jobDescription'] ?? '';
      dateController.text = data['startDate'] ?? '';
      costUSDController.text = data['paymentInUSD']?.toString() ?? '';
      costEGPController.text = data['paymentInEGP']?.toString() ?? '';
      companyNameController.text = data['companytName'] ?? '';
      companyContactController.text = data['companyContact'] ?? '';
      proofOfWorkController.text = data['proofOfWork'] ?? '';
      courseApproach = data['companyCountry'];
    }

    costUSDController.addListener(() {
      final usdText = costUSDController.text.trim();
      final usd = double.tryParse(usdText);

      if (usd != null) {
        final egp = usd * 50;
        costEGPController.text = egp.toStringAsFixed(2);
      } else {
        costEGPController.text = '';
      }
    });
  }

  bool _isFormValid() {
    return jobTitleController.text.isNotEmpty &&
        jobDescriptionController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        costUSDController.text.isNotEmpty &&
        costEGPController.text.isNotEmpty &&
        companyNameController.text.isNotEmpty &&
        courseApproach != null &&
        companyContactController.text.isNotEmpty &&
        proofOfWorkController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);
    final localizations = S.of(context);

    return BlocProvider(
      create: (_) => RemotjobCubit(),
      child: BlocConsumer<RemotjobCubit, RemotjobState>(
        listener: (context, state) {
          if (state is RemotjobLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (_) => Center(
                    child: CircularProgressIndicator(color: kColors[0]),
                  ),
            );
          } else {
            Navigator.of(context, rootNavigator: true).pop();
          }

          if (state is RemotjobSuccess) {
            showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(
                    title: Text(
                      widget.existingJobData == null
                          ? localizations.addedModal_addedTitle
                          : localizations.addedModal_updatedTitle,
                      style: TextStyles.grey12Medium.copyWith(
                        fontSize: 16,
                        color:
                            settingsProviders.isDark
                                ? Colors.white
                                : Colors.grey,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.existingJobData == null
                              ? localizations.addedModal_addedMessage
                              : localizations.addedModal_updatedMessage,
                          style: TextStyles.grey12Medium.copyWith(fontSize: 14),
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
                                settingsProviders.isDark
                                    ? kColors[0]
                                    : Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            localizations.remoteForm_buttons_back,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
            );
          } else if (state is RemotjobFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('errorMessage')));
          }
        },
        builder: (context, state) {
          return MainScaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.existingJobData == null
                        ? localizations.remoteForm_buttons_add
                        : localizations.remoteForm_buttons_update,
                    style: TextStyles.black15Medium.copyWith(
                      fontWeight: FontWeight.bold,
                      color:
                          settingsProviders.isDark
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      SvgPicture.asset(Assets.assetsRectangle),
                      SizedBox(width: 4.w),
                      Text(
                        localizations.jobTypeRemoteMonthly,
                        style: TextStyles.black15Medium.copyWith(
                          fontWeight: FontWeight.bold,
                          color:
                              settingsProviders.isDark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  _buildLabel(
                    localizations.remoteForm_jobTitle_placeholder,
                    settingsProviders,
                  ),
                  CustomTextFiled(
                    controller: jobTitleController,
                    hittext: localizations.remoteForm_jobTitle_placeholder,
                  ),
                  _buildHelperText(localizations.remoteForm_jobTitle_desc),

                  _buildLabel(
                    localizations.remoteForm_jobDescription_placeholder,
                    settingsProviders,
                  ),
                  CustomTextFiled(
                    controller: jobDescriptionController,
                    hittext:
                        localizations.remoteForm_jobDescription_placeholder,
                  ),
                  _buildHelperText(
                    localizations.remoteForm_jobDescription_desc,
                  ),

                  _buildLabel(
                    localizations.remoteForm_startDate_placeholder,
                    settingsProviders,
                  ),
                  CustomTextFiled(
                    controller: dateController,
                    hittext: localizations.dateFormatHint,
                    suffixIcon: const Icon(Icons.date_range_outlined),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        dateController.text =
                            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                      }
                    },
                  ),

                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel(
                              localizations.remoteForm_paymentInUSD_placeholder,
                              settingsProviders,
                            ),
                            CustomTextFiled(
                              controller: costUSDController,
                              hittext:
                                  localizations
                                      .remoteForm_paymentInUSD_placeholder,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SvgPicture.asset(
                                  Assets.assetsusd,
                                  width: 10.w,
                                  height: 10.h,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel(
                              localizations.remoteForm_paymentInEGP_placeholder,
                              settingsProviders,
                            ),
                            SizedBox(height: 8.h),
                            CustomTextFiled(
                              controller: costEGPController,
                              hittext: '00.0',
                              readOnly: true,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SvgPicture.asset(
                                  Assets.assetsegp,
                                  width: 20.w,
                                  height: 20.h,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),
                  _buildLabel(
                    localizations.remoteForm_companyName_placeholder,
                    settingsProviders,
                  ),
                  CustomTextFiled(
                    controller: companyNameController,
                    hittext: localizations.remoteForm_companyName_placeholder,
                  ),
                  SizedBox(height: 24.h),

                  FormFieldWithDropdown(
                    title: localizations.remoteForm_companyCountry_placeholder,
                    subtitle: localizations.remoteForm_companyCountry_required,
                    dropDownText: courseApproach,
                    items: worldCountries,
                    onChanged:
                        (value) => setState(() => courseApproach = value),
                    backgroundColor: kColors[0],
                  ),

                  SizedBox(height: 16.h),
                  _buildLabel(
                    localizations.remoteForm_companyContact_placeholder,
                    settingsProviders,
                  ),
                  CustomTextFiled(
                    controller: companyContactController,
                    hittext:
                        localizations.remoteForm_companyContact_placeholder,
                  ),
                  _buildHelperText(
                    localizations.remoteForm_companyContact_desc,
                  ),

                  _buildLabel(
                    localizations.remoteForm_proofOfWork_placeholder,
                    settingsProviders,
                  ),
                  CustomTextFiled(
                    controller: proofOfWorkController,
                    hittext: localizations.remoteForm_proofOfWork_placeholder,
                  ),

                  SizedBox(height: 24.h),
                  Text(
                    localizations.remoteForm_proofOfWork_desc,
                    style: TextStyles.grey12Medium.copyWith(fontSize: 14),
                  ),

                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: Text(localizations.remoteForm_buttons_back),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: CustomButtonWidget(
                          text:
                              widget.existingJobData == null
                                  ? localizations.remoteForm_buttons_add
                                  : localizations.remoteForm_buttons_update,
                          onPressed: () {
                            if (!_isFormValid()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: kColors[0],
                                  content: Center(child: Text('errorMessage')),
                                ),
                              );
                              return;
                            }

                            final jobData = {
                              'jobTitle': jobTitleController.text.trim(),
                              'jobDescription':
                                  jobDescriptionController.text.trim(),
                              'startDate': dateController.text.trim(),
                              'paymentInUSD':
                                  double.tryParse(
                                    costUSDController.text.trim(),
                                  ) ??
                                  0,
                              'paymentInEGP':
                                  double.tryParse(
                                    costEGPController.text.trim(),
                                  ) ??
                                  0,
                              'companytName': companyNameController.text.trim(),
                              'companyCountry': courseApproach,
                              'companyContact':
                                  companyContactController.text.trim(),
                              'proofOfWork': proofOfWorkController.text.trim(),
                            };

                            if (widget.existingJobData != null &&
                                widget.jobId != null) {
                              context.read<RemotjobCubit>().updateRemoteJob(
                                widget.jobId!,
                                jobData,
                              );
                            } else {
                              context.read<RemotjobCubit>().addRemoteJob(
                                jobData,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String title, SettingsProvider settingsProvider) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.black10SemiBold.copyWith(
            fontSize: 14,
            color: settingsProvider.isDark ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          S.of(context).remoteForm_jobTitle_required,
          style: TextStyles.grey12Medium.copyWith(fontSize: 8),
        ),
      ],
    );
  }

  Widget _buildHelperText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 16.0),
      child: Text(text, style: TextStyles.grey12Medium.copyWith(fontSize: 11)),
    );
  }
}
