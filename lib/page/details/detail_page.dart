import 'package:flutter/material.dart';
import 'package:flutter_study_day7/page/details/components/back_drop_and_rating.dart';
import 'package:flutter_study_day7/theme.dart';

import 'detail_page_argument.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailPageArgument;

    return Scaffold(
      body: Column(
      children: <Widget>[
        BackDropAndRating(tvListResultObject: args.tvListResultObject)
      ],
    )
    );
  }
}
