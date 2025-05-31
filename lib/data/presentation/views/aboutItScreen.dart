import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';

class AboutItScreen extends StatefulWidget {
  const AboutItScreen({super.key});

  static const routeName = '/about-it-screen';

  @override
  _AboutItScreenState createState() => _AboutItScreenState();
}

class _AboutItScreenState extends State<AboutItScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final List<Map<String, String>> _sections = [
      {
        'title': s.learnMore_slides_1_title,
        'content1': s.learnMore_slides_1_content_1,
        'content2': s.learnMore_slides_1_content_2,
      },
      {
        'title': s.learnMore_slides_2_title,
        'content1': s.learnMore_slides_2_content_1,
        'content2': s.learnMore_slides_2_content_2,
      },
      {
        'title': s.learnMore_slides_3_title,
        'content1': s.learnMore_slides_3_content_1,
        'content2': s.learnMore_slides_3_content_2,
      },
      {
        'title': s.learnMore_slides_4_title,
        'content1': s.learnMore_slides_4_content_1,
        'content2': s.learnMore_slides_4_content_2,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Icon(Icons.arrow_back_ios, color: kColors[0]),
              const SizedBox(width: 4),
              Text(
                s.settings_back,
                style: TextStyle(color: kColors[0], fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.learnMore_title,
              style: TextStyles.red15SemiBold.copyWith(fontSize: 18),
            ),
            SizedBox(height: 8.h),
            Text(s.learnMore_subtitle, style: TextStyles.grey12Medium),
            SizedBox(height: 16.h),
            Center(
              child: SvgPicture.asset(
                Assets.assetsImagesBoy,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              s.learnMore_howToUse,
              style: TextStyles.red15SemiBold.copyWith(fontSize: 18),
            ),
            SizedBox(height: 16.h),

            SizedBox(
              height: 250.h,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          itemCount: _sections.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _sections[index]['title']!,
                                  style: TextStyles.red15SemiBold.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _sections[index]['content1']!,
                                  style: TextStyles.grey12Medium,
                                ),
                                if (_sections[index]['content2']!
                                    .isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  Text(
                                    _sections[index]['content2']!,
                                    style: TextStyles.grey12Medium,
                                  ),
                                ],
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: _sections.length,
                          effect: WormEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: Colors.red,
                            dotColor: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),
            Center(
              child: Text(
                s.footerCopyright,
                style: TextStyles.grey12Medium.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
