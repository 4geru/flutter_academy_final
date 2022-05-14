import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/simple_tv_object.dart';
import 'package:flutter_study_day7/page/root/components/base_tab.dart';
import 'package:flutter_study_day7/theme.dart';

class HistoryTab extends BaseTab {
  List<SimpleTvObject> histories;
  HistoryTab({required this.histories});

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

  Widget body() {
    return ListView(
      children: <Widget>[
        const Card(child: ListTile(title: Text('履歴一覧'))),
        ...histories.map((e) {
          return Card(
            child: ListTile(
              leading: Image.network(
                'https://image.tmdb.org/t/p/w300/${e.posterPath}',
              ),
              title: Text(e.originalName),
            ),
          );
        })
      ],
    );
  }
}
