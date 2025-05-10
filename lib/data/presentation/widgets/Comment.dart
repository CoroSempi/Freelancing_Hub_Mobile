import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, 
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Text('🎉 Congratulations!', style: TextStyles.red15SemiBold),
          Text(
            'We are thrilled to inform you that your Website Development for Local Bakery has been officially approved! Your efforts and commitment have not gone unnoticed, and we look forward to seeing your contributions in this new role. ',
          ),
        ],
      ),
    );
  }
}
