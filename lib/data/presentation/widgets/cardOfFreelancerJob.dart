import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/details.dart';

class CardOfFreelancerJob extends StatelessWidget {
  const CardOfFreelancerJob({
    Key? key,
    required this.title,
    required this.description,
    required this.contributors,
    required this.startDate,
    required this.completionDate,
    required this.budget,
    required this.currency,
    required this.comments,
  }) : super(key: key);

  final String title;
  final String description;
  final String contributors;
  final String startDate;
  final String completionDate;
  final String budget;
  final String currency;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.green, width: 2), // Green border as in the screenshot
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: TextStyles.black15SemiBold,

            ),
            const SizedBox(height: 8),
            // Description
            Text(
              description,
                  style: TextStyles.red15SemiBoldOpacity,

            ),
            const SizedBox(height: 12),
            // Contributors
            Text(
              'Contributors: $contributors',
                  style: TextStyles.black10SemiBold,

            ),
            const SizedBox(height: 12),
            // Dates Row
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.red),
                const SizedBox(width: 4),
                Text(
                  'Start: $startDate',
                     style: TextStyles.black10SemiBold,
                ),
                const SizedBox(width: 16),
                const Icon(Icons.calendar_today, size: 16, color: Colors.red),
                const SizedBox(width: 4),
                Text(
                  'Completion: $completionDate',
                     style: TextStyles.black10SemiBold,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Budget, Currency, Comments Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '\$$budget',
                         style: TextStyles.red15SemiBold.copyWith(color: Colors.green),

                    ),
                    const SizedBox(width: 8),
                    Text(
                      currency,
                         style: TextStyles.red15SemiBold.copyWith(color: Colors.green),

                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.comment, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(
                      '$comments Comments',
                         style: TextStyles.grey12Medium,

                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      child: Text(
                        'READ MORE',
                          style: TextStyles.red15SemiBold,
                      ),
                      onTap: () {
                        Navigator.push(context,  MaterialPageRoute(builder: (context) => JobDetails()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}