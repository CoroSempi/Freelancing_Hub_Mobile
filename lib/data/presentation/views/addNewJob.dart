import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/platFormScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';

class AddNewJobScreen extends StatelessWidget {
  static const routeName = '/add-task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freelancing Hub'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.red),
          onPressed: () {
            // Handle menu action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add New Job',
              style: TextStyles.black20SemiBold,
            ),
            const SizedBox(height: 16),
            const Text(
              'Choose job type',
              style: TextStyles.black15SemiBold,
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                RadioListTile(
                  activeColor: Colors.red,  
                fillColor: MaterialStateProperty.all(Colors.red),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0), // تقليل الهوامش

                   title: const Text(
                    'Freelancing job on platform',
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'platform',
                  groupValue: 'jobType',
                  onChanged: (value) {
                    // Handle selection
                  },
                ),
                RadioListTile(
                   activeColor: Colors.red,  
                fillColor: MaterialStateProperty.all(Colors.red),
                 contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),  

                  title: const Text(
                    'Freelancing job with direct contact',
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'directContact',
                  groupValue: 'jobType',
                  onChanged: (value) {
                    // Handle selection
                  },
                ),
                RadioListTile(
                   activeColor: Colors.red,  
                fillColor: MaterialStateProperty.all(Colors.red),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0), // تقليل الهوامش

                  title: const Text(
                    'Remote monthly job',
                    style: TextStyles.black12SemiBold,
                  ),
                  value: 'remoteMonthly',
                  groupValue: 'jobType',
                  onChanged: (value) {
                    // Handle selection
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 170,
                  height: 40,
                  child: CustomButtonWidget(
                    text: "Back",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 40,
                  child: CustomButtonWidget(
                    text: "Next",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlatformScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Please select the appropriate type to ensure it is categorized correctly. Here are the options:',
              style: TextStyles.grey12Medium,
            ),
            const SizedBox(height: 8),
            const Text(
              '• Freelancing job on platform: Select this option if the job is posted on freelancing platforms like Mostaql, Khamsat, Upwork, etc. These jobs typically involve working through a third-party site that handles payments and communications.',
              style: TextStyles.grey12Medium,
            ),
            const SizedBox(height: 8),
            const Text(
              '• Freelancing job with direct contact: Choose this if the job comes from your personal network, such as connections on LinkedIn or referrals. These jobs often involve direct communication with the client without a middleman.',
              style: TextStyles.grey12Medium,
            ),
            const SizedBox(height: 8),
            const Text(
              '• Remote monthly job: Use this option for traditional remote positions that offer a monthly salary. These jobs may have structured hours and responsibilities similar to in-office roles.',
              style: TextStyles.grey12Medium,
            ),
          ],
        ),
      ),
    );
  }
}
