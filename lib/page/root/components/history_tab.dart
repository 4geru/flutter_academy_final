import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/history_provider.dart';
import '../../details/detail_page.dart';
import '../../details/detail_page_argument.dart';
import '../../details/hooks.dart';

class HistoryTab extends StatelessWidget {
  final BottomNavigationBar bottomNavigationBar;
  const HistoryTab({required this.bottomNavigationBar, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.watch<UseDetailPage>();
    final histories =
        Provider.of<HistoryProvider>(context).histories.reversed.toList();
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 50.0,
              title: Text('ANYA in history'),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
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
                          settings: const RouteSettings(name: '/details/:id'),
                          builder: (context) => DetailPage(
                              argument: DetailPageArgument(
                                  tvId: history.id, year: 1000 // not selected
                                  )),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  ),
                );
              })
            ]))
          ],
        ),
        bottomNavigationBar: bottomNavigationBar);
  }
}
