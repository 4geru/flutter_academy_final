import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/loading.dart';
import '../../theme.dart';
import 'components/back_drop_and_rating.dart';
import 'components/cast_and_crew.dart';
import 'components/genres.dart';
import 'components/overview.dart';
import 'components/seasons.dart';
import 'components/title_duration_and_fav_btn.dart';
import 'detail_page_argument.dart';
import 'hooks.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.argument}) : super(key: key);
  final DetailPageArgument argument;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late UseDetailPage useDetailPage;

  @override
  Widget build(BuildContext context) {
    // ページ情報を取得する
    final store = context.watch<UseDetailPage>();

    if (store.isLoading()) {
      return const LoadingComponent();
    }
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        BackDropAndRating(tvDetailResultObject: store.tvDetailResultObject!, tvWatchProviderResultObject: store.tvWatchProviderResultObject!),
        const SizedBox(height: anyaDefaultPadding),
        TitleDurationAndFabBtn(
            tvDetailResultObject: store.tvDetailResultObject!),
        Genres(genres: store.tvDetailResultObject?.genres ?? []),
        if (store.tvDetailResultObject?.overview != '')
          Overview(overview: store.tvDetailResultObject?.overview ?? ''),
        if (store.tvDetailResultObject?.seasons != null)
          Seasons(
              seasons: store.tvDetailResultObject!.seasons,
              year: widget.argument.year),
        CastAndCrew(casts: store.aggregateCreditObject!.casts ?? []),
      ],
    )));
  }
}
