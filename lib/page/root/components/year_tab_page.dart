import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/history_provider.dart';
import '../../../model/simple_tv_object.dart';
import '../../../model/tv_list_result_object.dart';
import '../../../service/tmdb_api_service.dart';
import '../../details/detail_page.dart';
import '../../details/detail_page_argument.dart';
import '../../details/hooks.dart';

class YearTabPage extends StatefulWidget {
  const YearTabPage(this.year, this.scrollController, {Key? key})
      : super(key: key);
  final int year;
  final ScrollController scrollController;

  @override
  State<YearTabPage> createState() => _YearTabPageState();
}

class _YearTabPageState extends State<YearTabPage> {
  List<TvListResultObject> _list = [];
  int page = 1;
  bool loading = false;

  Future<void> fetch() async {
    if (loading) return;
    setState(() => loading = true);
    final list1 = await TmdbApiService().getDiscoverTv(widget.year, page: page);
    setState(() {
      _list = [..._list, ...list1];
      loading = false;
      page = page + 1;
    });
  }

  @override
  void initState() {
    fetch();
    super.initState();
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels >=
              widget.scrollController.position.maxScrollExtent / 2 &&
          !loading) {
        fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<UseDetailPage>();
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.count(
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 3,
          children: _list.map((tvListResultObject) {
            final tvId = tvListResultObject.id;
            return GestureDetector(
                onTap: () {
                  store.fetch(tvId);
                  // 履歴に追加する
                  final simpleTvObject = SimpleTvObject(
                      id: tvId,
                      originalName: tvListResultObject.originalName,
                      posterPath: tvListResultObject.posterPath,
                      timestamp: DateTime.now());
                  Provider.of<HistoryProvider>(context, listen: false)
                      .insert(simpleTvObject);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: const RouteSettings(name: '/details/:id'),
                      builder: (context) => DetailPage(
                          argument: DetailPageArgument(
                              tvId: tvId, year: widget.year)),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Image.network(
                    'https://image.tmdb.org/t/p/w300/${tvListResultObject.posterPath}',
                    fit: BoxFit.cover));
          }).toList(),
        ));
  }
}
