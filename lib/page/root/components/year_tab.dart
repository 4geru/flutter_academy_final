import 'package:flutter/material.dart';
import 'package:flutter_study_day7/package/bubble_tab_indicator.dart';
import 'package:flutter_study_day7/page/root/components/base_tab.dart';
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

class YearTab extends BaseTab {
  TabController controller;
  int selectedYear;

  YearTab({required this.controller, required this.selectedYear});

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text(
        'ANYA in ${selectedYear.toString()}',
        style: const TextStyle(
          color: anyaTextColor,
        ),
      ),
      bottom: TabBar(
        isScrollable: true,
        controller: controller,
        tabs: tabsInfo.map((TabInfo tab) {
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
    );
  }

  Widget body() {
    return TabBarView(
      children: tabsInfo.map((tab) => tab.widget).toList(),
      controller: controller,
    );
  }
}
