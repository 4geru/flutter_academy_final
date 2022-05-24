import 'package:flutter/material.dart';

import '../../../components/show_more.dart';
import '../../../theme.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key, required this.overview}) : super(key: key);
  final String overview;

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
            '概要',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: anyaDefaultPadding),
            child: ExpandableText(
              overview,
              maxLines: 5,
              style: const TextStyle(fontSize: 12),
            ))
      ],
    );
  }
}
