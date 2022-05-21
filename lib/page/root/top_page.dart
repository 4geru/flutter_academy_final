import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/page/root/components/history_tab.dart';
import 'package:flutter_study_day7/page/root/components/year_tab.dart';

class TopHomePage extends StatefulWidget {
  const TopHomePage({Key? key}) : super(key: key);

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage> with SingleTickerProviderStateMixin{
  late TabController _controller;
  int _selectedTabIndex = 0;
  int _selectedYear = targetYears().last;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: targetYears().length,
      initialIndex: targetYears().length - 1,
      vsync: this
    );

    _controller.addListener(() =>
      setState(() => _selectedYear = targetYears()[_controller.index])
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      currentIndex: _selectedTabIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_sharp, size: 20), activeIcon: Icon(Icons.home_rounded, size: 30), label: 'ホーム'),
        BottomNavigationBarItem(icon: Icon(Icons.history_sharp, size: 20), activeIcon: Icon(Icons.history_rounded, size: 30), label: '履歴'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp, size: 20), activeIcon: Icon(Icons.favorite_rounded, size: 30), label: 'お気に入り'),
      ],
      elevation: 5.0,
      onTap: (index){
        setState(() {
          _selectedTabIndex = index;
        });
      },
    );
    final Widget selectedWidget;
    if(_selectedTabIndex == 1) {
      selectedWidget = HistoryTab(bottomNavigationBar: bottomNavigationBar);
    } else {
      selectedWidget = YearTab(bottomNavigationBar: bottomNavigationBar);
    }

    return selectedWidget;
  }
}
