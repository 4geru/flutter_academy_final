import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/page/details/components/genre_card.dart';
import 'package:flutter_study_day7/theme.dart';

class Genres extends StatelessWidget {
  final TvListResultObject tvListResultObject;
  const Genres({Key? key, required this.tvListResultObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: anyaDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tvListResultObject.genreIds.length,
          itemBuilder: (context, index) => GenreCard(
            genreId: tvListResultObject.genreIds[index],
          ),
        ),
      ),
    );
  }
}