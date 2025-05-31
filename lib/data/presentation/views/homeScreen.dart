import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/providers/setting_provider.dart';
import 'package:iti_freelancing_hub/data/presentation/views/addNewJob.dart';
import 'package:iti_freelancing_hub/data/presentation/views/chat.dart';
import 'package:iti_freelancing_hub/data/presentation/views/setting.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_home.dart';
import 'package:iti_freelancing_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CustomeHome(),
    Chat(),
    AddNewJobScreen(), // Verify if AddNewJobScreen is the correct page for adding a job, as CustomeHome used AddNote
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final s = S.of(context);

    final List<BottomNavigationBarItem> _items = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: s.homeTabLabel),
      BottomNavigationBarItem(icon: Icon(Icons.chat), label: s.chatTabLabel),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline),
        label: s.addJobTabLabel,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: s.settingsTabLabel,
      ),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _items,
        selectedItemColor: settingsProvider.isDark ? kColors[5] : kColors[5],
        unselectedItemColor:
            settingsProvider.isDark ? Colors.grey : Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
