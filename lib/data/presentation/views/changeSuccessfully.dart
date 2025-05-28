import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/CustomButtonWidget.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class ChangeSuccessfullyDialog extends StatelessWidget {
  const ChangeSuccessfullyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final s = S.of(context); // Added for localization

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              s.changedSuccessfullyTitle, // Localized title
              style: TextStyles.title.copyWith(
                color: settingsProvider.isDark ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              s.passwordChangedMessage, // Localized message
              style: TextStyles.grey12Medium.copyWith(
                color: settingsProvider.isDark ? Colors.white70 : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SvgPicture.asset(
              Assets.assetsImagesTrue,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 24),
            CustomButtonWidget(
              text: s.signInButton, // Localized button text
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Usage: showDialog(context: context, barrierDismissible: false, builder: (context) => ChangeSuccessfullyDialog());