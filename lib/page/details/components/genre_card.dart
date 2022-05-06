import 'package:flutter/material.dart';
import 'package:flutter_study_day7/theme.dart';

class GenreCard extends StatelessWidget {
  final int genreId;

  const GenreCard({Key? key, required this.genreId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: anyaDefaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: anyaDefaultPadding,
        vertical: anyaDefaultPadding / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genreId.toString(),
        style: TextStyle(color: anyaTextColor.withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}