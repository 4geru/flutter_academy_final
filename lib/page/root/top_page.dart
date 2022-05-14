import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/package/bubble_tab_indicator.dart';
import 'package:flutter_study_day7/page/root/year_tab_page.dart';
import 'package:flutter_study_day7/theme.dart';

class TabInfo {
  int year;
  Widget widget;

  TabInfo(this.year, this.widget);
}

List<int> targetYears () {
  const int fromYear = 1996;
  int toYear = DateTime.now().year;
  return List<int>.generate(toYear - fromYear + 1, (i) => i + fromYear);
}

final List<TabInfo> tabsInfo = targetYears().map((year) =>
  TabInfo(year, YearTabPage(year))
).toList();

class TopHomePage extends StatefulWidget {
  const TopHomePage({Key? key}) : super(key: key);

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage> with SingleTickerProviderStateMixin{
  late TabController _controller;
  final List<TabInfo> _tabs = tabsInfo;
  int _selectedYear = tabsInfo.last.year;
  int selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedYear = _tabs[_controller.index].year;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return DefaultTabController(
        length: _tabs.length,
        initialIndex: _tabs.length - 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'ANYA in ${_selectedYear.toString()}',
              style: const TextStyle(
                color: anyaTextColor,
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              controller: _controller,
              tabs: _tabs.map((TabInfo tab) {
                return Tab(
                  text: tab.year.toString(),
                );
              }).toList(),
              labelColor: const Color(0xFF0F1021),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BubbleTabIndicator(
                indicatorHeight: 30.0,
                indicatorColor: anyaWhiteColor,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
            )
          ),
          body: TabBarView(
            children: _tabs.map((tab) => tab.widget).toList(),
            controller: _controller,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_sharp, size: 20), activeIcon: Icon(Icons.home_rounded, size: 30), label: 'ホーム'),
              BottomNavigationBarItem(icon: Icon(Icons.history_sharp, size: 20), activeIcon: Icon(Icons.history_rounded, size: 30), label: '履歴'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp, size: 20), activeIcon: Icon(Icons.favorite_rounded, size: 30), label: 'お気に入り'),
            ],
            elevation: 5.0,
            currentIndex: selectedPage,
            onTap: (index){
              setState(() {
                selectedPage = index;
              });
            },
          )
      ),
    );
  }
}
