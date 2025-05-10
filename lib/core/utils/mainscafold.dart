import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/draw_item.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(),
      appBar: AppBar(
        title: SvgPicture.asset(Assets.assetsLogo),
        automaticallyImplyLeading: false,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black.withOpacity(0.2), 
            height: 2.0,
          ),
        ),
      ),
      body: body,
    );
  }
}
