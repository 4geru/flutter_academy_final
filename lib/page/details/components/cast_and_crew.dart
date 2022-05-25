import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/locale_provider.dart';
import '../../../model/aggregate_credit_object.dart';
import '../../../theme.dart';
import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {
  const CastAndCrew({Key? key, required this.casts}) : super(key: key);
  final List<Cast> casts;

  @override
  Widget build(BuildContext context) {
    final l10n = Provider.of<LocaleProvider>(context).load();
    return Padding(
      padding: const EdgeInsets.all(anyaDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.detail_cast,
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
