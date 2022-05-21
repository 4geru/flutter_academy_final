import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/data/repo/history_provider.dart';
import 'package:flutter_study_day7/model/simple_tv_object.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/package/bubble_tab_indicator.dart';
import 'package:flutter_study_day7/page/details/detail_page.dart';
import 'package:flutter_study_day7/page/details/detail_page_argument.dart';
import 'package:flutter_study_day7/page/details/hooks.dart';
import 'package:flutter_study_day7/page/root/components/base_tab.dart';
import 'package:flutter_study_day7/page/root/components/history_tab.dart';
import 'package:flutter_study_day7/page/root/components/year_tab.dart';
import 'package:flutter_study_day7/page/root/components/year_tab_page.dart';
import 'package:flutter_study_day7/service/tmdb_api_service.dart';
import 'package:flutter_study_day7/theme.dart';
import 'package:provider/provider.dart';

class TopHomePage extends StatefulWidget {
  const TopHomePage({Key? key}) : super(key: key);

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage> with SingleTickerProviderStateMixin{
  late TabController _controller;
  int _selectedTabIndex = 0;
  int _selectedYear = tabsInfo.last.year;
  List<TvListResultObject> _list = []; // FIXME: remove

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
    fetch();
  }

  void fetch() async {
    List<TvListResultObject> list = await TmdbApiService().getDiscoverTv(_selectedYear, page: 1);
    setState(() {
      _list = [..._list, ...list];
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    late BaseTab selectedTab;
    // if(_selectedTabIndex == 0 || _selectedTabIndex == 2) {
      selectedTab = YearTab(controller: _controller, selectedYear: _selectedYear);
    // } else {
    //   selectedTab = HistoryTab(context: context, selectedYear: _selectedYear);
    // }

    // FIXME: mew
    final ScrollController _scrollController = ScrollController();

    final store = context.watch<UseDetailPage>();
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          selectedTab.appBar(),
          // selectedTab.body(),
          YearTabPage(_selectedYear, _scrollController)
          // SliverGrid(
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 120.0,
          //     mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 2 / 3,
          //   ),
          //   delegate: SliverChildListDelegate(
          //       _list.map((TvListResultObject tvListResultObject) {
          //         int tvId = tvListResultObject.id;
          //         return GestureDetector(
          //             onTap: () {
          //               store.fetch(tvId);
          //               // 履歴に追加する
          //               SimpleTvObject simpleTvObject = SimpleTvObject(
          //                   id: tvId,
          //                   originalName: tvListResultObject.originalName,
          //                   posterPath: tvListResultObject.posterPath,
          //                   timestamp: DateTime.now()
          //               );
          //               Provider.of<HistoryProvider>(context, listen: false).insert(simpleTvObject);
          //               Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   settings: const RouteSettings(name: "/details/:id"),
          //                   builder: (BuildContext context) => DetailPage(
          //                       argument: DetailPageArgument(
          //                           tvId: tvId,
          //                           year: _selectedYear
          //                       )
          //                   ),
          //                   fullscreenDialog: true,
          //                 ),
          //               );
          //             },
          //             child: Image.network(
          //               'https://image.tmdb.org/t/p/w300/${tvListResultObject.posterPath}',
          //             )
          //         );
          //       }).toList()
          //   )
          // ),
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
  }
}
