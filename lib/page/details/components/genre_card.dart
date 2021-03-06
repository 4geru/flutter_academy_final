import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/theme_provider.dart';
import '../../../model/tv_detail_result_object.dart';
import '../../../theme.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({Key? key, required this.genre}) : super(key: key);
  final Genre genre;

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
        color: (Provider.of<ThemeProvider>(context, listen: false).isDark
            ? const Color(0x1FFFFFFF)
            : anyaWhiteColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre.name.toString(),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
