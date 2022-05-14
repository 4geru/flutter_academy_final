import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/theme.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key? key,
    required this.tvListResultObject,
  }) : super(key: key);

  final TvListResultObject tvListResultObject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(anyaDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tvListResultObject.originalName,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: anyaDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      tvListResultObject.firstAirDate,
                      style: const TextStyle(color: anyaTextColor),
                    ),
                    const SizedBox(width: anyaDefaultPadding),
                    const Text(
                      "PG-13",
                      style: TextStyle(color: anyaTextColor),
                    ),
                    const SizedBox(width: anyaDefaultPadding),
                    const Text(
                      "2h 32min",
                      style: TextStyle(color: anyaTextColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FlatButton(
              onPressed: () {},
              color: anyaSecondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                Icons.add,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
