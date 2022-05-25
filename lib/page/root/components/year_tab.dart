import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/locale_provider.dart';
import '../../../data/repo/theme_provider.dart';
import '../../../package/bubble_tab_indicator.dart';
import '../../../theme.dart';
import 'year_tab_page.dart';

List<int> targetYears() {
  const fromYear = 1996;
  final toYear = DateTime.now().year;
  return List<int>.generate(toYear - fromYear + 1, (i) => i + fromYear);
}

class YearTab extends StatefulWidget {
  const YearTab({required this.bottomNavigationBar, Key? key})
      : super(key: key);
  final BottomNavigationBar bottomNavigationBar;

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
        vsync: this);

    yearTabController.addListener(() => setState(() {
          selectedYear = targetYears()[yearTabController.index];
        }));
  }

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final l10n = Provider.of<LocaleProvider>(context).load();
    return Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: false,
                snap: true,
                floating: true,
                title: Text(
                  '${selectedYear.toString()}${l10n.home_title}',
                ),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: targetYears().map((year) {
                    return Tab(
                      text: year.toString(),
                    );
                  }).toList(),
                  unselectedLabelColor:
                      (Provider.of<ThemeProvider>(context).isDark
                          ? anyaWhiteColor
                          : Colors.grey[800]),
                  labelColor: anyaTextColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BubbleTabIndicator(
                    indicatorHeight: 30.0,
                    indicatorColor: (Provider.of<ThemeProvider>(context).isDark
                        ? anyaColor
                        : anyaWhiteColor),
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
                return YearTabPage(year, _scrollController, l10n.locale);
              }).toList()),
        ),
        bottomNavigationBar: widget.bottomNavigationBar);
  }
}
