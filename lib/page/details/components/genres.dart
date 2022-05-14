import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/tv_detail_result_object.dart';
import 'package:flutter_study_day7/page/details/components/genre_card.dart';
import 'package:flutter_study_day7/theme.dart';

class Genres extends StatelessWidget {
  final List<Genre> genres;
  const Genres({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: anyaDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) => GenreCard(
            genre: genres[index],
          ),
        ),
      ),
    );
  }
}
