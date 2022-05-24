import 'package:flutter/material.dart';

import '../../../model/tv_detail_result_object.dart';
import '../../../theme.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key? key,
    required this.tvDetailResultObject,
  }) : super(key: key);
  final TvDetailResultObject tvDetailResultObject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(anyaDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tvDetailResultObject.originalName,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: anyaDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                        '${tvDetailResultObject.firstAirDate.year}年${tvDetailResultObject.firstAirDate.month}月${tvDetailResultObject.firstAirDate.day}日'),
                    const SizedBox(width: anyaDefaultPadding),
                    Text(
                        '${tvDetailResultObject.numberOfSeasons}シーズン ${tvDetailResultObject.numberOfEpisodes}話'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
