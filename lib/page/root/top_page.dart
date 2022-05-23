import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/page/root/components/setting_tab.dart';

import 'components/history_tab.dart';
import 'components/year_tab.dart';

class TopHomePage extends StatefulWidget {
  const TopHomePage({Key? key}) : super(key: key);

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedTabIndex = 0;
  int _selectedYear = targetYears().last;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        length: targetYears().length,
        initialIndex: targetYears().length - 1,
        vsync: this);

    _controller.addListener(
        () => setState(() => _selectedYear = targetYears()[_controller.index]));
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final bottomNavigationBar = BottomNavigationBar(
      currentIndex: _selectedTabIndex,
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home_sharp, size: 20),
            activeIcon: const Icon(Icons.home_rounded, size: 30),
            label: AppLocalizations.of(context).home),
        BottomNavigationBarItem(
            icon: const Icon(Icons.history_sharp, size: 20),
            activeIcon: const Icon(Icons.history_rounded, size: 30),
            label: AppLocalizations.of(context).history),
        BottomNavigationBarItem(
            icon: const Icon(Icons.person_sharp, size: 20),
            activeIcon: const Icon(Icons.person_rounded, size: 30),
            label: AppLocalizations.of(context).setting),
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
