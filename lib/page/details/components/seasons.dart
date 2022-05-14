import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/tv_detail_result_object.dart';
import 'package:flutter_study_day7/theme.dart';

class Seasons extends StatefulWidget {
  int year;
  List<Season> seasons;
  Seasons({Key? key, required this.seasons, required this.year}) : super(key: key);

  @override
  State<Seasons> createState() => _SeasonsState();
}

class _SeasonsState extends State<Seasons> {
  bool _openSeason = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
              title: const Text('シーズン'),
              trailing: _openSeason ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
              onTap: () => setState(() =>_openSeason = !_openSeason)
          ),
        ),
        if(_openSeason)
          ...(widget.seasons ?? []).map((e) {
            String openDate = "${e.airDate?.year}年${e.airDate?.month}月${e.airDate?.day}日 | ";
            return Card(
              child: ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w300/${e.posterPath}',
                  ),
                  title: Text(e.name),
                  subtitle: Column(
                    children: [
                      Row(
                          children: [
                            if(widget.year == e.airDate?.year)
                              const Icon(
                                Icons.favorite,
                                color: anyaSecondaryColor,
                                size: 24.0
                              ),
                            Text("${e.airDate != null ? openDate : ''}${e.episodeCount}話"),
                          ]
                      ),
                      Text(
                        e.overview ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
              ),
            );
          }),
      ],
    );
    // return ;
  }
}
