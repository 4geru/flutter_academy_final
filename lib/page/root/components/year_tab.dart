import 'package:flutter/material.dart';
import '../../../package/bubble_tab_indicator.dart';
import 'year_tab_page.dart';
import '../../../theme.dart';

List<int> targetYears () {
  const fromYear = 1996;
  final toYear = DateTime.now().year;
  return List<int>.generate(toYear - fromYear + 1, (i) => i + fromYear);
}

class YearTab extends StatefulWidget {
  final BottomNavigationBar bottomNavigationBar;
  const YearTab({required this.bottomNavigationBar, Key? key}) : super(key: key);

  @override
  State<YearTab> createState() => _YearTabState();
}

class _YearTabState extends State<YearTab> with SingleTickerProviderStateMixin {
  late int selectedYear;
  late TabController yearTabController;
  @override
  void initState() {
    super.initState();
    selectedYear = targetYears().last;
    yearTabController = TabController(
      length: targetYears().length,
      initialIndex: targetYears().length - 1,
      vsync: this
    );

    yearTabController.addListener(() =>
      setState(() {
        selectedYear = targetYears()[yearTabController.index];
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
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
                  controller: yearTabController,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: yearTabController,
            children: targetYears().map((year) {
              return YearTabPage(year, _scrollController);
            }).toList()
          ),
        ),
        bottomNavigationBar: widget.bottomNavigationBar
    );
  }
}
