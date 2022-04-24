import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/page/details/detail_page_argument.dart';
import 'package:flutter_study_day7/service/tmdb_api_service.dart';

class YearTabPage extends StatefulWidget {
  int year;
  YearTabPage(this.year, {Key? key}) : super(key: key);

  @override
  State<YearTabPage> createState() => _YearTabPageState();
}

class _YearTabPageState extends State<YearTabPage> {
  List<TvListResultObject> _list = [];

  void setList() async {
    List<TvListResultObject> list = await TmdbApiService().getDiscoverTv(widget.year);
    setState(() {
      _list = list;
    });
  }

  @override
  void initState() {
    setList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: _list.map((TvListResultObject e) {
                    String tvId = e.id.toString();
                    return GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(
                              context, '/details/:id',
                              arguments: DetailPageArgument(
                                  tvId: tvId,
                                  year: widget.year,
                                  tvListResultObject: e
                              )
                          )
                        },
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w300/${e.posterPath}',
                        )
                    );
                  }).toList()
              ),
            ),
          ],
        )
    );
  }
}
