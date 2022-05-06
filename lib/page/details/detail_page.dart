import 'package:flutter/material.dart';
import 'package:flutter_study_day7/page/details/components/back_drop_and_rating.dart';
import 'package:flutter_study_day7/page/details/components/overview.dart';
import 'package:flutter_study_day7/page/details/components/title_duration_and_fav_btn.dart';
import 'package:flutter_study_day7/theme.dart';

import 'detail_page_argument.dart';

class DetailPage extends StatefulWidget {
  final DetailPageArgument argument;
  const DetailPage({Key? key, required this.argument}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:
        Column(
          children: <Widget>[
            BackDropAndRating(tvListResultObject: widget.argument.tvListResultObject),
            SizedBox(height: anyaDefaultPadding / 2),
            TitleDurationAndFabBtn(tvListResultObject: widget.argument.tvListResultObject),
            // Genres(tvListResultObject: widget.argument.tvListResultObject),
            Overview(tvListResultObject: widget.argument.tvListResultObject),
            // CastAndCrew(tvListResultObject: widget.argument.tvListResultObject),
          ],
        )
      )
    );
  }
}
