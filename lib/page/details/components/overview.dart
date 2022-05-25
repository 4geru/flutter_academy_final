import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/show_more.dart';
import '../../../data/repo/locale_provider.dart';
import '../../../theme.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key, required this.overview}) : super(key: key);
  final String overview;

  @override
  Widget build(BuildContext context) {
    final l10n = Provider.of<LocaleProvider>(context).load();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: anyaDefaultPadding / 2,
            horizontal: anyaDefaultPadding,
          ),
          child: Text(
            l10n.detail_overview,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: anyaDefaultPadding),
            child: ExpandableText(
              overview,
              maxLines: 5,
              style: const TextStyle(fontSize: 12),
              openLabel: l10n.open,
              closeLabel: l10n.close,
            ))
      ],
    );
  }
}
