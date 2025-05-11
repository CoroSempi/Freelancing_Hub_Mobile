import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/addNewJob.dart';
import 'package:iti_freelancing_hub/data/presentation/views/details.dart';
import 'package:iti_freelancing_hub/data/presentation/views/notification.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/cardOFDetailsFreelancerJob.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/cardOfFreelancerJob.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_Buttom.dart';

class CustomeHome extends StatelessWidget {
  const CustomeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
   
   
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                
                             
             Row(
              children: [ 
                SvgPicture.asset(
              Assets.assetsImagesPerson,
              width: 70,
              height: 70,
                      
            ),
            const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back ',
                      style: TextStyles.black15Medium,
                    ),
                    const SizedBox(width: 8),
                      Text(

                      'Seif El-Islam',
                      style: TextStyles.black20SemiBold,
                      
                    ),
                  ],
                ),
            
           
              ],
            ),
           
            const SizedBox(width: 16),
               InkWell(
                 child: SvgPicture.asset(
                    Assets.assetsImagesNotification,
                    width: 31,
                    height: 31,
                               ),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) =>   Notifications(),
                     ),
                   );
                 },
               ), 
               ],
             ),
      
            const SizedBox(height: 16),
            CardOfDetailsFreelancerJob(
              track: 'Front end and cross platform',
              totalJobs: '3',
              completedApprovedJobs: '2',
              totalProfitEarnedUS: '\$500',
              totalProfitEarnedEGP: '29,300 EGP',
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SvgPicture.asset(
                      Assets.assetsImagesCongratulation,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: const Text(
                        'Congratulations on reaching your target! We are incredibly proud of you and your hard work! This is a fantastic achievement, and we want you to take a moment to celebrate your success. Keep shining and moving forward, you’re doing great!',
                        style: TextStyles.black15Medium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Freelancing Jobs',
                  style: TextStyles.black15SemiBold,
                ),
                Container(
                  width: 120,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: ShapeDecoration(
                    color: const Color(0x3344B40D),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 0.5,
                        color: Color(0xFF44B30C),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child:   Center(
                    child: InkWell(
                      child: Text(
                        'Add New Job',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF44B30C),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:  (context) =>   AddNewJobScreen()));

                       },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CardOfFreelancerJob(
              title: 'Website Development for Local Bakery',
              description:
                  'Developed a responsive website for a bakery that showcases products and allows customers to place orders online.',
              contributors: 'Seif El-Islam, Tomas Arsal',
              startDate: 'Jan 1, 2023',
              completionDate: 'Jan 15, 2023',
              budget: '500',
              currency: 'USD',
              comments: '2 Comments',
            ),
            const SizedBox(height: 16),
            CardOfFreelancerJob(
              title: 'UI/UX Design for E-commerce Website',
              description:
                  'Designed an intuitive and visually appealing user interface for an e-commerce website.',
              contributors: 'Seif El-Islam',
              startDate: 'Jan 5, 2023',
              completionDate: 'Jan 20, 2023',
              budget: '400',
              currency: 'USD',
              comments: '1 Comment',
            ),
            const SizedBox(height: 16),
            CardOfFreelancerJob(
              title: 'Landing Page Design for Product Launch',
              description:
                  'Designed a high-converting landing page for the launch of a new product.',
              contributors: 'Seif El-Islam',
              startDate: 'Jan 10, 2023',
              completionDate: 'Jan 18, 2023',
              budget: '600',
              currency: 'USD',
              comments: '1 Comment',
            ),
          ],
        ),
      ),
   
   
   
    );
  }
}
