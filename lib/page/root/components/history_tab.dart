import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/history_provider.dart';
import '../../../data/repo/locale_provider.dart';
import '../../details/detail_page.dart';
import '../../details/detail_page_argument.dart';
import '../../details/hooks.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({required this.bottomNavigationBar, Key? key})
      : super(key: key);
  final BottomNavigationBar bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final store = context.watch<UseDetailPage>();
    final histories = Provider.of<HistoryProvider>(context, listen: true)
        .histories
        .reversed
        .toList();
    final l10n = Provider.of<LocaleProvider>(context).load();
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 50.0,
              title: Text(l10n.history_title),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              ListTile(title: Text(l10n.history_list)),
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
