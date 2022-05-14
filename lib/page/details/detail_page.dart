import 'package:flutter/material.dart';
import 'package:flutter_study_day7/components/loading.dart';
import 'package:flutter_study_day7/page/details/components/back_drop_and_rating.dart';
import 'package:flutter_study_day7/page/details/components/cast_and_crew.dart';
import 'package:flutter_study_day7/page/details/components/genres.dart';
import 'package:flutter_study_day7/page/details/components/overview.dart';
import 'package:flutter_study_day7/page/details/components/title_duration_and_fav_btn.dart';
import 'package:flutter_study_day7/page/details/hooks.dart';
import 'package:flutter_study_day7/theme.dart';
import 'package:provider/provider.dart';

import 'detail_page_argument.dart';

class DetailPage extends StatefulWidget {
  final DetailPageArgument argument;
  const DetailPage({Key? key, required this.argument}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late UseDetailPage useDetailPage;
  bool _openSeason = false;

  @override
  Widget build(BuildContext context) {
    // ページ情報を取得する
    final store = context.watch<UseDetailPage>();

    if(store.isLoading()) {
      return const LoadingComponent();
    }
    return Scaffold(
      body: SingleChildScrollView(child:
        Column(
          children: <Widget>[
            BackDropAndRating(tvDetailResultObject: store.tvDetailResultObject!),
            const SizedBox(height: anyaDefaultPadding),
            TitleDurationAndFabBtn(tvDetailResultObject: store.tvDetailResultObject!),
            Genres(genres: store.tvDetailResultObject?.genres ?? []),
            if(store.tvDetailResultObject?.overview != '') Overview(overview: store.tvDetailResultObject?.overview ?? ""),
            Card(
              child: ListTile(
                title: const Text('シーズン'),
                trailing: _openSeason ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
                onTap: () => setState(() =>_openSeason = !_openSeason)
              ),
            ),
            if(_openSeason)
              ...(store.tvDetailResultObject?.seasons ?? []).map((e) {
                String openDate = "${e.airDate?.year}年${e.airDate?.month}月${e.airDate?.day}日";
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      'https://image.tmdb.org/t/p/w300/${e.posterPath}',
                    ),
                    title: Text(e.name),
                    subtitle: Row(
                      children: [
                        if(
                          widget.argument.year == e.airDate?.year ||
                          (e.airDate == null && widget.argument.year != e.airDate?.year)
                        ) const Icon(
                          Icons.favorite,
                          color: anyaSecondaryColor,
                          size: 24.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                        Text("${e.airDate != null ? openDate : ''}${e.episodeCount}話"),
                      ]
                    )
                  ),
                );
              }),
            CastAndCrew(casts: store.aggregateCreditObject!.casts ?? []),
          ],
        )
      )
    );
  }
}
