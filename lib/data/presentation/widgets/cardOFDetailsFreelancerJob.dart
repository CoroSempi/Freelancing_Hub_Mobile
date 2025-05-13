import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';

class CardOfDetailsFreelancerJob extends StatelessWidget {
  final String track;
  final String totalJobs;
  final String completedApprovedJobs;
  final String totalProfitEarnedUS;
  final String totalProfitEarnedEGP;

  const CardOfDetailsFreelancerJob({
    super.key,
    required this.track,
    required this.totalJobs,
    required this.completedApprovedJobs,
    required this.totalProfitEarnedUS,
    required this.totalProfitEarnedEGP,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Track:', track),
        SizedBox(height: 10),
        _buildDetailRow('Total Jobs:', totalJobs),
        SizedBox(height: 10),

        _buildDetailRow('Completed and Approved Jobs:', completedApprovedJobs),
        SizedBox(height: 10),

        _buildDetailRow('Total Profit Earned (US):', totalProfitEarnedUS),
        SizedBox(height: 10),

        _buildDetailRow('Total Profit Earned (EGP):', totalProfitEarnedEGP),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadows: [
          BoxShadow(
            color: Color(0x332E2E2E),
            blurRadius: 5,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(label, style: TextStyles.black12SemiBoldWithHeight),

          Text(value, style: TextStyles.red15SemiBoldOpacity),
        ],
      ),
    );
  }
}
