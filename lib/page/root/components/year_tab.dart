import 'package:flutter/material.dart';
import 'package:flutter_study_day7/package/bubble_tab_indicator.dart';
import 'package:flutter_study_day7/page/root/components/year_tab_page.dart';
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

class YearTab extends StatelessWidget {
  final int selectedYear;
  final BottomNavigationBar bottomNavigationBar;
  const YearTab({required this.selectedYear, required this.bottomNavigationBar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return Scaffold(
        body: DefaultTabController(
          length: targetYears().length,
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                _headerSection(selectedYear),
              ];
            },
            body: TabBarView(
                children: targetYears().map((year) {
                  return YearTabPage(year, _scrollController);
                }).toList()
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar
    );
  }
}

//header部分
SliverAppBar _headerSection(int selectedYear) {
  return SliverAppBar(
    pinned: false,
    snap: true,
    floating: true,
    title: Text(
      'ANYA in ${selectedYear.toString()}',
      style: const TextStyle(
        color: anyaTextColor,
      ),
    ),
    bottom: TabBar(
      isScrollable: true,
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
    ),
  );
}

//SliverPersistentHeaderDelegateを継承したTabBarを作る
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(
      color: anyaColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
