import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import '../../data/repo/locale_provider.dart';
import 'components/history_tab.dart';
import 'components/setting_tab.dart';
import 'components/year_tab.dart';

class TopHomePage extends StatefulWidget {
  const TopHomePage({Key? key}) : super(key: key);

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = Provider.of<LocaleProvider>(context).load();

    FlutterNativeSplash.remove();
    final bottomNavigationBar = BottomNavigationBar(
      currentIndex: _selectedTabIndex,
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home_sharp, size: 20),
            activeIcon: const Icon(Icons.home_rounded, size: 30),
            label: l10n.top_home_tab),
        BottomNavigationBarItem(
            icon: const Icon(Icons.history_sharp, size: 20),
            activeIcon: const Icon(Icons.history_rounded, size: 30),
            label: l10n.top_history_tab),
        BottomNavigationBarItem(
            icon: const Icon(Icons.person_sharp, size: 20),
            activeIcon: const Icon(Icons.person_rounded, size: 30),
            label: l10n.top_setting_tab),
      ],
      elevation: 5.0,
      onTap: (index) {
        setState(() {
          _selectedTabIndex = index;
        });
      },
    );
    final Widget selectedWidget;
    if (_selectedTabIndex == 1) {
      selectedWidget = HistoryTab(bottomNavigationBar: bottomNavigationBar);
    } else if (_selectedTabIndex == 2) {
      selectedWidget = SettingTab(bottomNavigationBar: bottomNavigationBar);
    } else {
      selectedWidget = YearTab(bottomNavigationBar: bottomNavigationBar);
    }

    return selectedWidget;
  }
}
