import 'package:flutter/material.dart';
import 'package:flutter_study_day7/data/repo/history_provider.dart';
import 'package:flutter_study_day7/model/simple_tv_object.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/page/details/detail_page.dart';
import 'package:flutter_study_day7/page/details/detail_page_argument.dart';
import 'package:flutter_study_day7/page/details/hooks.dart';
import 'package:flutter_study_day7/service/tmdb_api_service.dart';
import 'package:provider/provider.dart';

class YearTabPage extends StatefulWidget {
  final int year;
  final ScrollController scrollController;
  const YearTabPage(this.year, this.scrollController, {Key? key}) : super(key: key);

  @override
  State<YearTabPage> createState() => _YearTabPageState();
}

class _YearTabPageState extends State<YearTabPage> {
  List<TvListResultObject> _list = [];
  int page = 1;
  bool loading = false, allLoad = false;

  void fetch() async {
    if(loading)return;
    setState(() => loading = true);
    List<TvListResultObject> list = await TmdbApiService().getDiscoverTv(widget.year, page: page);
    setState(() {
      _list = [..._list, ...list];
      loading = false;
      page = page + 1;
    });
  }

  @override
  void initState() {
    fetch();
    super.initState();
    widget.scrollController.addListener(() {
      if(widget.scrollController.position.pixels >= widget.scrollController.position.maxScrollExtent / 2 && !loading) {
        fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<UseDetailPage>();
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 160.0,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 2 / 3,
      ),
      delegate: SliverChildListDelegate(
          _list.map((TvListResultObject tvListResultObject) {
            int tvId = tvListResultObject.id;
            return GestureDetector(
                onTap: () {
                  store.fetch(tvId);
                  // 履歴に追加する
                  SimpleTvObject simpleTvObject = SimpleTvObject(
                      id: tvId,
                      originalName: tvListResultObject.originalName,
                      posterPath: tvListResultObject.posterPath,
                      timestamp: DateTime.now()
                  );
                  Provider.of<HistoryProvider>(context, listen: false).insert(simpleTvObject);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: const RouteSettings(name: "/details/:id"),
                      builder: (BuildContext context) => DetailPage(
                          argument: DetailPageArgument(
                              tvId: tvId,
                              year: widget.year
                          )
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Image.network(
                  'https://image.tmdb.org/t/p/w300/${tvListResultObject.posterPath}',
                )
            );
          }).toList()
      )
    );
  }
}
