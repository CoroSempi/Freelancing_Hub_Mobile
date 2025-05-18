import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:provider/provider.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      // drawer: MainDrawer(),
      appBar: AppBar(
        title:
            settingsProvider.isDark
                ? SvgPicture.asset(Assets.assetlogodark)
                : SvgPicture.asset(Assets.assetsLogo),
        automaticallyImplyLeading: false,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.black.withOpacity(0.2), height: 2.0),
        ),
      ),
      body: body,
    );
  }
}
