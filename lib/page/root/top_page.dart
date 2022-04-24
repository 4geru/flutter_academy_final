import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/page/root/year_tab_page.dart';

class TabInfo {
  int year;
  Widget widget;

  TabInfo(this.year, this.widget);
}

List<int> targetYears () {
  const int fromYear = 1996;
  int toYear = DateTime.now().year;
  return new List<int>.generate(toYear - fromYear + 1, (i) => i + fromYear);
}

final List<TabInfo> tabsInfo = targetYears().map((year) =>
  TabInfo(year, YearTabPage(year))
).toList();

class TopHomePage extends StatefulWidget {
  const TopHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage> {
  final List<TabInfo> _tabs = tabsInfo;
  int _selectedYear = tabsInfo.last.year;

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
              style: TextStyle(
                color: Color(0xFF0F1021)
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: _tabs.map((TabInfo tab) {
                return Tab(
                  text: tab.year.toString(),
                );
              }).toList(),
              onTap: (index) {
                setState(() {
                  _selectedYear = _tabs[index].year;
                });
              },
              labelColor: Color(0xFF0F1021),
            )
          ),
          body: TabBarView(
            children: _tabs.map((tab) => tab.widget).toList()
          )
      ),
    );
  }
}
