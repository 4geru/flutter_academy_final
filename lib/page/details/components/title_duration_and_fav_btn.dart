import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/locale_provider.dart';
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
    final l10n = Provider.of<LocaleProvider>(context).load();
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
                    Text('${l10n.detail_start_date} '),
                    Text(
                        '${tvDetailResultObject.firstAirDate.year}/${tvDetailResultObject.firstAirDate.month}/${tvDetailResultObject.firstAirDate.day}'),
                    const SizedBox(width: anyaDefaultPadding),
                    Text(
                        '${tvDetailResultObject.numberOfSeasons}${l10n.detail_season} ${tvDetailResultObject.numberOfEpisodes}${l10n.story_count}'),
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
