import 'package:flutter/material.dart';
import 'package:flutter_study_day7/data/repo/history_provider.dart';
import 'package:flutter_study_day7/model/simple_tv_object.dart';
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
    store.fetch(widget.argument.tvListResultObject.id);

    const casts = [
      {
        'profilePath': '/c79SXutqQ02zaGi07sqWCbO96re.jpg',
        'originalName': 'Rina Sato',
        'character': 'Mikoto Misaka',
      },
      {
        'profilePath': '/v95wU1gpSLAOJS5yKFTxyheXAW2.jpg',
        'originalName': 'Satomi Arai',
        'character': 'Kuroko Shirai',
      },
      {
        'profilePath': '/c79SXutqQ02zaGi07sqWCbO96re.jpg',
        'originalName': 'Rina Sato',
        'character': 'Mikoto Misaka',
      },
      {
        'profilePath': '/v95wU1gpSLAOJS5yKFTxyheXAW2.jpg',
        'originalName': 'Satomi Arai',
        'character': 'Kuroko Shirai',
      },
      {
        'profilePath': '/c79SXutqQ02zaGi07sqWCbO96re.jpg',
        'originalName': 'Rina Sato',
        'character': 'Mikoto Misaka',
      },
      {
        'profilePath': '/v95wU1gpSLAOJS5yKFTxyheXAW2.jpg',
        'originalName': 'Satomi Arai',
        'character': 'Kuroko Shirai',
      }
    ];

    // 履歴に追加する
    SimpleTvObject simpleTvObject = SimpleTvObject(
      id: widget.argument.tvListResultObject.id,
      originalName: widget.argument.tvListResultObject.originalName,
      posterPath: widget.argument.tvListResultObject.posterPath,
    );
    Provider.of<HistoryProvider>(context).insert(simpleTvObject);
    if(store.isLoading()) {
      return Text('loading');
    }

    return Scaffold(
        body: SingleChildScrollView(child:
        Column(
          children: <Widget>[
            BackDropAndRating(tvListResultObject: widget.argument.tvListResultObject),
            const SizedBox(height: anyaDefaultPadding),
            TitleDurationAndFabBtn(tvListResultObject: widget.argument.tvListResultObject),
            Genres(genres: store.tvDetailResultObject?.genres ?? []),
            if(widget.argument.tvListResultObject.overview.isNotEmpty) Overview(overview: widget.argument.tvListResultObject.overview),
            const CastAndCrew(casts: casts),
          ],
        )
      )
    );
  }
}
