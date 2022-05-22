import 'package:flutter/material.dart';

import '../../../model/tv_detail_result_object.dart';
import '../../../theme.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;

  const GenreCard({Key? key, required this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: anyaDefaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: anyaDefaultPadding,
        vertical: anyaDefaultPadding / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        // TODO: dark <> light
        color: const Color(0x1FFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre.name.toString(),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
