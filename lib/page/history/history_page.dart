import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/data/repo/history_provider.dart';
import 'package:flutter_study_day7/model/simple_tv_object.dart';
import 'package:flutter_study_day7/theme.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    List<SimpleTvObject> histories = Provider.of<HistoryProvider>(context).histories.reversed.toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ANYA in history',
            style: TextStyle(
              color: anyaTextColor,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Card(child: ListTile(title: Text('履歴一覧'))),
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_sharp, size: 20), activeIcon: Icon(Icons.home_rounded, size: 30), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.history_sharp, size: 20), activeIcon: Icon(Icons.history_rounded, size: 30), label: '履歴'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp, size: 20), activeIcon: Icon(Icons.favorite_rounded, size: 30), label: 'お気に入り'),
          ],
          elevation: 5.0,
          currentIndex: selectedPage,
          onTap: (index){
            setState(() {
              if(index == 0) {
                Navigator.restorablePushNamed(context, '/');
              } else {
                selectedPage = index;
              }
            });
          },
        )
    );
  }
}
