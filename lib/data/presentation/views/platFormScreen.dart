import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';

import 'package:iti_freelancing_hub/data/presentation/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart'; // Import generated localization

class PlatformScreen extends StatelessWidget {
  PlatformScreen({super.key});
  TextEditingController dateController = TextEditingController();
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
  final List<String> freelancingPlatforms = [
    "Mostaql",
    "Khamsat",
    "Nafathly",
    "BeFreelancr",
    "Ureed",
    "FreelanceME",
    "Muwazi",
    "TasmeemME",
    "Upwork",
    "Freelancer",
    "Toptal",
    "PeoplePerHour",
    "Guru",
    "99designs",
    "DesignCrowd",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);
    final s = S.of(context); // Access localized strings

    return MainScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.addNewJobTitle,
              style: TextStyles.black15Medium.copyWith(
                fontWeight: FontWeight.bold,
                color: settingsProviders.isDark ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            settingsProviders.isDark
                ? SvgPicture.asset(Assets.assetsPlatFormDark)
                : SvgPicture.asset(Assets.assetsPlatFormLight),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  s.platformForm_jobTitle_placeholder,
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color: settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (${s.platformForm_jobTitle_required})',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: s.platformForm_jobTitle_placeholder),
            SizedBox(height: 2.h),
            Text(
              s.platformForm_jobTitle_desc,
              style: TextStyles.grey12Medium.copyWith(fontSize: 12),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  s.platformForm_jobDescription_placeholder,
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color: settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (${s.platformForm_jobDescription_required})',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: s.platformForm_jobDescription_placeholder),
            SizedBox(height: 2.h),
            Text(
              s.platformForm_jobDescription_desc,
              style: TextStyles.grey12Medium.copyWith(fontSize: 12),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            s.platformForm_startDate_placeholder,
                            style: TextStyles.black10SemiBold.copyWith(
                              fontSize: 14,
                              color: settingsProviders.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            ' (${s.platformForm_startDate_required})',
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFiled(
                        controller: dateController,
                        hittext: s.dateFormatHint,
                        suffixIcon: Icon(Icons.date_range_outlined),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                            dateController.text = formattedDate;
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
                      Row(
                        children: [
                          Text(
                            s.endDateLabel,
                            style: TextStyles.black10SemiBold.copyWith(
                              fontSize: 14,
                              color: settingsProviders.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            ' (${s.platformForm_endDate_required})',
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFiled(
                        controller: dateController,
                        hittext: s.dateFormatHint,
                        suffixIcon: Icon(Icons.date_range_outlined),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                            dateController.text = formattedDate;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            s.platformForm_costInUSD_placeholder,
                            style: TextStyles.black10SemiBold.copyWith(
                              fontSize: 14,
                              color: settingsProviders.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            ' (${s.platformForm_costInUSD_required})',
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFiled(
                        controller: dateController,
                        hittext: s.platformForm_costInUSD_placeholder,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            Assets.assetsusd,
                            width: 20,
                            height: 20,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            s.platformForm_costInEGP_placeholder,
                            style: TextStyles.black10SemiBold.copyWith(
                              fontSize: 14,
                              color: settingsProviders.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            ' (${s.platformForm_costInEGP_required})',
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFiled(
                        hittext: '00.0',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            Assets.assetsegp,
                            width: 20,
                            height: 20,
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
            // FormFieldWithDropdown(
            //   title: s.platformForm_teamMembers_placeholder,
            //   subtitle: '(${s.platformForm_teamMembers_required})',
            //   dropDownText: 'dropDownText',
            //   items: ['Online', 'Offline', 'Both'],
            //   backgroundColor: kColors[5],
            // ),
            SizedBox(height: 24.h),
            // FormFieldWithDropdown(
            //   title: s.platformForm_platform_placeholder,
            //   subtitle: '(${s.platformForm_platform_required})',
            //   dropDownText: 'dropDownText',
            //   items: freelancingPlatforms,
            //   backgroundColor: kColors[0],
            // ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  s.platformForm_studentProfile_placeholder,
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color: settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (${s.platformForm_studentProfile_required})',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: s.platformForm_studentProfile_placeholder),
            SizedBox(height: 2.h),
            Text(
              s.platformForm_studentProfile_desc,
              style: TextStyles.grey12Medium.copyWith(fontSize: 12),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  s.platformForm_clientName_placeholder,
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color: settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (${s.platformForm_clientName_required})',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: s.platformForm_clientName_placeholder),
            SizedBox(height: 24.h),
            // FormFieldWithDropdown(
            //   title: s.platformForm_clientCountry_placeholder,
            //   subtitle: '(${s.platformForm_clientCountry_required})',
            //   dropDownText: 'dropDownText',
            //   items: worldCountries,
            //   backgroundColor: kColors[0],
            // ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  s.platformForm_clientProfile_placeholder,
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color: settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (${s.platformForm_clientProfile_required})',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: s.platformForm_clientProfile_placeholder),
            SizedBox(height: 2.h),
            Text(
              s.platformForm_clientProfile_desc,
              style: TextStyles.grey12Medium.copyWith(fontSize: 12),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  s.platformForm_proofOfWork_placeholder,
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color: settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (${s.platformForm_proofOfWork_required})',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: s.platformForm_proofOfWork_placeholder),
            SizedBox(height: 24.h),
            Text(
              s.platformForm_proofOfWork_desc,
              style: TextStyles.grey12Medium.copyWith(fontSize: 14),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(s.platformForm_buttons_back),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: CustomButtonWidget(
                    text: s.platformForm_buttons_add,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}