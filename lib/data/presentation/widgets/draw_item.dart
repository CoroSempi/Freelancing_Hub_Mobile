import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/images/app_images.dart';
import 'package:iti_freelancing_hub/core/utils/styles.dart';
import 'package:iti_freelancing_hub/data/presentation/views/add_task.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chats.dart';
import 'package:iti_freelancing_hub/data/presentation/views/homeScreen.dart';
import 'package:iti_freelancing_hub/data/presentation/views/setting.dart';
import 'package:iti_freelancing_hub/data/presentation/views/signIn.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(
    String title,
    VoidCallback tapHandler, {
    IconData? icon,
    TextStyle? style,
    Color? iconColor,
  }) {
    return ListTile(
      leading:
          icon != null ? Icon(icon, color: iconColor ?? Colors.black) : null,
      title: Text(
        title,
        style:
            style ??
            const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 26.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.assetsImagesIti,
                      width: 28,
                      height: 45,
                    ),
                    const SizedBox(width: 5),
                    Text('Freelancing Hub', style: TextStyles.title),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Craft Your Career, Shape Your Path',
                  style: TextStyles.grey12Medium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          buildListTile(
            'Home',
            () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
            icon: Icons.home,
            iconColor: kColors[0],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          buildListTile(
            'Chats',
            () {
              Navigator.of(context).pushReplacementNamed(ChatScreen.routeName);
            },
            icon: Icons.chat,
            iconColor: kColors[0],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          buildListTile(
            'Add New Job',
            () {
              Navigator.of(
                context,
              ).pushReplacementNamed(AddTaskScreen.routeName);
            },
            icon: Icons.work_outline,
            iconColor: kColors[0],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          buildListTile(
            'Settings',
            () {
              Navigator.of(
                context,
              ).pushReplacementNamed(SettingsPage.routeName);
            },
            icon: Icons.settings,
            iconColor: kColors[0],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          buildListTile(
            'About ITI Freelancing Hub',
            () {
              Navigator.of(
                context,
              ).pushReplacementNamed(AddTaskScreen.routeName);
            },
            icon: Icons.help_outline,
            iconColor: kColors[0],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          buildListTile(
            'Sign out',
            () {
              Navigator.of(context).pushReplacementNamed(SignIn.routeName);
            },
            icon: Icons.logout,
            iconColor: kColors[0],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
