import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_day7/components/show_more.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/theme.dart';

class Overview extends StatelessWidget {
  final String overview;
  const Overview({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: anyaDefaultPadding / 2,
            horizontal: anyaDefaultPadding,
          ),
          child: Text(
            "概要",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: anyaDefaultPadding),
            child: Container(
              child: ExpandableText(
                overview,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 12
                ),
              )
            )
        )
      ],
    );
  }
}
