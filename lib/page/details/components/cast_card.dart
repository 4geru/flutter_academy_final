import 'package:flutter/material.dart';

import '../../../model/aggregate_credit_object.dart';
import '../../../theme.dart';

class CastCard extends StatelessWidget {
  const CastCard({Key? key, required this.cast}) : super(key: key);
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: anyaDefaultPadding),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                'https://image.tmdb.org/t/p/w300/${cast.profilePath}',
              )),
            ),
          ),
          const SizedBox(height: anyaDefaultPadding / 2),
          Text(
            cast.originalName ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          const SizedBox(height: anyaDefaultPadding / 4),
          Text(cast.roles?.first.character ?? '',
              maxLines: 1, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
