import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    // ページ情報を取得する
    final store = context.watch<UseDetailPage>();

    if(store.isLoading()) {
      return const Text('loading');
    }

    return Scaffold(
      body: SingleChildScrollView(child:
        Column(
          children: <Widget>[
            BackDropAndRating(tvDetailResultObject: store.tvDetailResultObject!),
            const SizedBox(height: anyaDefaultPadding),
            TitleDurationAndFabBtn(tvDetailResultObject: store.tvDetailResultObject!),
            Genres(genres: store.tvDetailResultObject?.genres ?? []),
            if(store.tvDetailResultObject?.overview != null) Overview(overview: store.tvDetailResultObject?.overview ?? ""),
            CastAndCrew(casts: store.aggregateCreditObject!.casts ?? []),
          ],
        )
      )
    );
  }
}
