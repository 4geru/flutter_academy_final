import 'package:flutter/material.dart';
import 'package:flutter_study_day7/package/bubble_tab_indicator.dart';
import 'package:flutter_study_day7/page/root/components/base_tab.dart';
import 'package:flutter_study_day7/page/root/components/year_tab_page.dart';
import 'package:flutter_study_day7/theme.dart';

List<int> targetYears () {
  const int fromYear = 1996;
  int toYear = DateTime.now().year;
  return List<int>.generate(toYear - fromYear + 1, (i) => i + fromYear);
}

class YearTab extends BaseTab {
  TabController tabController;
  int selectedYear;

  YearTab({required this.tabController, required this.selectedYear});

  @override
  SliverAppBar appBar() {
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: true,
      expandedHeight: 100.0,
      title: Text(
        'ANYA in ${selectedYear.toString()}',
        style: const TextStyle(
          color: anyaTextColor,
        ),
      ),
      bottom: TabBar(
        isScrollable: true,
        controller: tabController,
        tabs: targetYears().map((year) {
          return Tab(
            text: year.toString(),
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

  @override
  Widget body() {
    return SliverFillRemaining(
      child: TabBarView(
        children: targetYears().map((year) {
          return YearTabPage(year);
        }).toList(),
        controller: tabController,
      )
    );
  }
}
