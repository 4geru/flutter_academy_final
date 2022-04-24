import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/service/tmdb_api_service.dart';

import 'detail_page_argument.dart';

class TopHomePage extends StatefulWidget {
  const TopHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TopHomePage> createState() => _TopHomePageState();
}

class _TopHomePageState extends State<TopHomePage> {
  int _year = 2023;
  List<TvListResultObject> _list = [];

  void _incrementCounter() async {
    List<TvListResultObject> list = await TmdbApiService().getDiscoverTv(_year - 1);
    setState(() {
      _list = list;
      _year--;
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} ${_year}'),
      ),
      body: Center(
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
                              year: _year,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
