import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/data/presentation/views/details.dart';
import 'package:iti_freelancing_hub/data/presentation/views/notification.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_Buttom.dart';

class CustomeHome extends StatelessWidget {
  const CustomeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Column(
        children: [
          SizedBox(height: 100),

          CustomButtoms(
            text: 'details',
            color: kColors[1],
            textcolor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (JobDetails())),
              );
            },
          ),

          SizedBox(height: 20),

          CustomButtoms(
            text: 'notification',
            color: kColors[1],
            textcolor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (Notifications())),
              );
            },
          ),
        ],
      ),
    );
  }
}
