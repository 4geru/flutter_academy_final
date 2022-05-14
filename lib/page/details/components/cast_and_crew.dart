import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/aggregate_credit_object.dart';

import 'package:flutter_study_day7/theme.dart';
import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {
  final List<Cast> casts;

  const CastAndCrew({Key? key, required this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(anyaDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "出演者",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: anyaDefaultPadding),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts.length,
              itemBuilder: (context, index) => CastCard(cast: casts[index]),
            ),
          )
        ],
      ),
    );
  }
}
