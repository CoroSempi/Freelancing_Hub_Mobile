import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/form-field.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/formFieldWithDropdown.dart';

class PlatformScreen extends StatelessWidget {
  const PlatformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Job'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.red),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Freelancing Job on Platform',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            FormFieldWidget(
              title: 'Job Title',
              subtitle: 'Enter the title of the job',
              hintText: 'Enter the title of the job',
            ),
            const SizedBox(height: 16),
            FormFieldWidget(
              title: 'Client Name',
              subtitle: 'Enter the client\'s name',
              hintText: 'Enter the client\'s name',
            ),
 

                        const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: FormFieldWidget(
                    title: 'Start Date',
                    subtitle: 'Enter the start date',
                    hintText: 'DD/MM/YYYY',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormFieldWidget(
                    title: 'End Date',
                    subtitle: 'Enter the end date',
                    hintText: 'DD/MM/YYYY',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FormFieldWidget(
                    title: 'Budget',
                    subtitle: 'Enter the budget',
                    hintText: 'Enter the budget',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormFieldWidget(
                    title: 'Currency',
                    subtitle: 'Enter the currency',
                    hintText: 'Enter the currency',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
    
FormFieldWithDropdown(title: 'Team members ', subtitle: '(optional )', dropDownText: 'dropDownText',),
            FormFieldWidget(
              title: 'Client Name ',
              subtitle: '(Required)',
              hintText: '',
            ),
            const SizedBox(height: 24),
            FormFieldWithDropdown(title: 'Client Country ', subtitle: '(Required)', dropDownText: 'dropDownText',),

         const SizedBox(height: 16),
    
FormFieldWithDropdown(title: 'Platform', subtitle: '(Required)', dropDownText: 'dropDownText',),

                 FormFieldWidget(
              title: 'Client Profile  on The Platform ',
              subtitle: '(Required)',
              hintText: 'Ensure to put the amount in USD currency.',
            ),
            const SizedBox(height: 24),
            FormFieldWidget(
              title: 'Your Profile on The Platform',
              subtitle: ' (Required)',
              hintText: 'Provide the link to your profile on the chosen platform.',
            ),
            const SizedBox(height: 24),
            FormFieldWidget(
              title: 'Proof of Work',
              subtitle: '(Required)',
              hintText: "Prepare a PDF document that includes screenshots of chats between you and the client, samples of the work completed, and proof of payment or invoices. Once you've compiled everything into a single PDF, upload it to Google Drive, copy the link, and paste it in here. Make sure the link is set to Anyone with the link can view so that admin can access it.",
            ),
               
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButtonWidget(
                    text: "Back",
                    onPressed: () {
                    },
                  ),
                ),
                Expanded(
                  child: CustomButtonWidget(
                    text: "Submit",
                    onPressed: () {
                    },
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