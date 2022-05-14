import 'package:flutter/material.dart';
import 'package:flutter_study_day7/data/repo/history_provider.dart';
import 'package:flutter_study_day7/model/simple_tv_object.dart';
import 'package:flutter_study_day7/page/details/detail_page.dart';
import 'package:flutter_study_day7/page/details/detail_page_argument.dart';
import 'package:flutter_study_day7/page/details/hooks.dart';
import 'package:flutter_study_day7/page/root/components/base_tab.dart';
import 'package:flutter_study_day7/theme.dart';
import 'package:provider/provider.dart';

class HistoryTab extends BaseTab {
  BuildContext context;
  int selectedYear;
  HistoryTab({required this.context, required this.selectedYear});

  @override
  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text(
        'ANYA in history',
        style: TextStyle(
          color: anyaTextColor,
        ),
      ),
    );
  }

  @override
  Widget body() {
    final store = context.watch<UseDetailPage>();
    List<SimpleTvObject> histories = Provider.of<HistoryProvider>(context).histories.reversed.toList();
    return ListView(
      children: <Widget>[
        const Card(child: ListTile(title: Text('履歴一覧'))),
        ...histories.map((history) {
          return Card(
            child: ListTile(
              leading: Image.network(
                'https://image.tmdb.org/t/p/w300/${history.posterPath}',
              ),
              title: Text(history.originalName),
              onTap: () {
                store.fetch(history.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/details/:id"),
                    builder: (BuildContext context) => DetailPage(
                      argument: DetailPageArgument(
                        tvId: history.id,
                        year: selectedYear
                      )
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          );
        })
      ],
    );
  }
}
