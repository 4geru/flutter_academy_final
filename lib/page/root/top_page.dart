import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/page/root/components/base_tab.dart';
import 'package:flutter_study_day7/page/root/components/history_tab.dart';
import 'package:flutter_study_day7/page/root/components/year_tab.dart';
import 'package:flutter_study_day7/page/root/components/year_tab_page.dart';
import 'package:flutter_study_day7/service/tmdb_api_service.dart';

class TopHomePage extends StatefulWidget {
  const TopHomePage({Key? key}) : super(key: key);

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  int _selectedTabIndex = 0;
  int _selectedYear = targetYears().last;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: targetYears().length,
        initialIndex: targetYears().length - 1,
        vsync: this
    );
    _tabController.addListener(() =>
      setState(() => _selectedYear = targetYears()[_tabController.index])
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    late BaseTab selectedTab;
    if(_selectedTabIndex == 0 || _selectedTabIndex == 2) {
      selectedTab = YearTab(tabController: _tabController, scrollController: _scrollController, selectedYear: _selectedYear);
    } else {
      selectedTab = HistoryTab(context: context, selectedYear: _selectedYear);
    }

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          selectedTab.appBar(),
          // TabBarView(
          //   children: targetYears().map((year) {
          //     return Text(year.toString());
          //   }).toList(),
          //   controller: _tabController,
          // )
          selectedTab.body(),
          // YearTabPage(_selectedYear, _scrollController)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      )
    );
  }
}
