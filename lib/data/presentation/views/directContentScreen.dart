import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/form-field.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/formFieldWithDropdown.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/text_field.dart';
import 'package:provider/provider.dart';

class DirectContentScreen extends StatelessWidget {
  TextEditingController SdateController = TextEditingController();
  TextEditingController EdateController = TextEditingController();

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

  final List<String> Contacts = [
    "LinkedIn",
    "WhatsApp",
    "Email",
    "In-person Meeting",
    "Friend or Family Referral",
    "ITI Community",
    "University/College Network",
    "Facebook Groups",
    "Telegram Groups",
    "Freelancing Events or Meetups",
    "Online Forums (e.g. Reddit, Quora)",
    "Previous Clients",
    "Others",
  ];
  @override
  Widget build(BuildContext context) {
    final settingsProviders = Provider.of<SettingsProvider>(context);

    return MainScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Job',
              style: TextStyles.black15Medium.copyWith(
                fontWeight: FontWeight.bold,
                color: settingsProviders.isDark?Colors.white: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            settingsProviders.isDark
                ? SvgPicture.asset(Assets.assetsDircDark)
                : SvgPicture.asset(Assets.assetsDircLight),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  'Job Title ',
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color:
                        settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (Required)',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: 'Job Title'),
            SizedBox(height: 2.h),
            Text(
              'Ensure that the title clearly describes the Job.',
              style: TextStyles.grey12Medium.copyWith(fontSize: 12),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  'Job Description ',
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color:
                        settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (Required)',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: 'Job Description'),
            SizedBox(height: 2.h),
            Text(
              'Ensure that the description clearly describes the Job.',
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
                            'Start Date ',
                            style: TextStyles.black10SemiBold.copyWith(
                              fontSize: 14,
                              color:
                                  settingsProviders.isDark
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                          Text(
                            ' (Required)',
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFiled(
                        controller: SdateController,
                        hittext: 'DD/MM/YYYY',
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
                            SdateController.text = formattedDate;
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
                            'End Date ',
                            style: TextStyles.black10SemiBold.copyWith(
                              fontSize: 14,
                              color:
                                  settingsProviders.isDark
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                          Text(
                            ' (Required)',
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFiled(
                        controller: EdateController,
                        hittext: 'DD/MM/YYYY',
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
                            EdateController.text = formattedDate;
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
                            'Cost in USD ',
                            style: TextStyles.black10SemiBold.copyWith(
                              fontSize: 14,
                              color:
                                  settingsProviders.isDark
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                          Text(
                            ' (Required)',
                            style: TextStyles.grey12Medium.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFiled(
                        hittext: 'Cost in USD',
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
                            'Cost in EGP ',
                            style: TextStyles.black10SemiBold.copyWith(
                              fontSize: 14,
                              color:
                                  settingsProviders.isDark
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                          Text(
                            ' (Required)',
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
            //   title: 'Team members ',
            //   subtitle: '(Required)',
            //   dropDownText: 'dropDownText',
            //   items: ['Online', 'Offline', 'Both'],
            //   backgroundColor: kColors[5],
            // ),
            SizedBox(height: 24.h),
            // FormFieldWithDropdown(
            //   title: 'Platform ',
            //   subtitle: '(Required)',
            //   dropDownText: 'dropDownText',
            //   items: Contacts,
            //   backgroundColor: kColors[0],
            // ),

            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  'Client Name ',
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color:
                        settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (Required)',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: 'Client Name'),

            SizedBox(height: 24.h),
            // FormFieldWithDropdown(
            //   title: 'Client Country ',
            //   subtitle: '(Required)',
            //   dropDownText: 'dropDownText',
            //   items: worldCountries,
            //   backgroundColor: kColors[0],
            // ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  'Client Contact  ',
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color:
                        settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (Required)',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: 'Client Contact '),
            SizedBox(height: 2.h),
            Text(
              "Make sure to include either the client's profile link on the platform or their contact number.",
              style: TextStyles.grey12Medium.copyWith(fontSize: 12),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  'Proof of Work ',
                  style: TextStyles.black10SemiBold.copyWith(
                    fontSize: 14,
                    color:
                        settingsProviders.isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  ' (Required)',
                  style: TextStyles.grey12Medium.copyWith(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            CustomTextFiled(hittext: 'Proof of Work'),

            SizedBox(height: 24.h),
            Text(
              'Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you have compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to Anyone with the link can view so that admin can access it.',
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
                    child: const Text('Back'),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: CustomButtonWidget(text: "Submit", onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
