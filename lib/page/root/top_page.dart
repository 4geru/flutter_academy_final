import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/page/root/components/base_tab.dart';
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
  int _selectedYear = tabsInfo.last.year;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        length: tabsInfo.length,
        initialIndex: tabsInfo.length - 1,
        vsync: this
    );

    _controller.addListener(() =>
      setState(() => _selectedYear = tabsInfo[_controller.index].year)
    );
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    // late BaseTab selectedTab;
    // if(_selectedTabIndex == 0 || _selectedTabIndex == 2) {
    //   selectedTab = YearTab(controller: _controller, selectedYear: _selectedYear);
    // } else {
    //   selectedTab = HistoryTab(context: context, selectedYear: _selectedYear);
    // }
    // return Scaffold(
    //   appBar: selectedTab.appBar(),
    //   body: selectedTab.body(),
    //   bottomNavigationBar: BottomNavigationBar(
    //     currentIndex: _selectedTabIndex,
    //     items: const [
    //       BottomNavigationBarItem(icon: Icon(Icons.home_sharp, size: 20), activeIcon: Icon(Icons.home_rounded, size: 30), label: 'ホーム'),
    //       BottomNavigationBarItem(icon: Icon(Icons.history_sharp, size: 20), activeIcon: Icon(Icons.history_rounded, size: 30), label: '履歴'),
    //       BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp, size: 20), activeIcon: Icon(Icons.favorite_rounded, size: 30), label: 'お気に入り'),
    //     ],
    //     elevation: 5.0,
    //     onTap: (index){
    //       setState(() {
    //         _selectedTabIndex = index;
    //       });
    //     },
    //   )
    // );

    return Scaffold(
      // appBar: AppBar(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _headerSection(),
              _tabSection(),
            ];
          },
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        fontSize: 100,
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        fontSize: 100,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//header部分
Widget _headerSection() {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Container(
          color: Colors.orangeAccent,
          height: 100,
          child: const Center(
            child: Text('headerSection'),
          ),
        ),
      ],
    ),
  );
}

//TabBar部分
Widget _tabSection() {
  return const SliverPersistentHeader(
    pinned: true,
    delegate: _StickyTabBarDelegate(
      tabBar: TabBar(
        labelColor: Colors.black,
        tabs: [
          Tab(
            text: '1',
          ),
          Tab(
            text: '2',
          )
        ],
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
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}