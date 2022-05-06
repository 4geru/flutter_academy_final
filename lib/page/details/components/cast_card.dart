import 'package:flutter/material.dart';

import 'package:flutter_study_day7/theme.dart';

class CastCard extends StatelessWidget {
  final Map cast;

  const CastCard({Key? key, required this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: anyaDefaultPadding),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w300/${cast['profilePath']}",
                )
              ),
            ),
          ),
          const SizedBox(height: anyaDefaultPadding / 2),
          Text(
            cast['originalName'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          const SizedBox(height: anyaDefaultPadding / 4),
          Text(
            cast['character'],
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(color: anyaTextColor),
          ),
        ],
      ),
    );
  }
}
