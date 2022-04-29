import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/theme.dart';

class BackDropAndRating extends StatelessWidget {
  final TvListResultObject tvListResultObject;
  const BackDropAndRating({Key? key, required this.tvListResultObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final posterPath = 'https://image.tmdb.org/t/p/w300/${tvListResultObject.backdropPath}';
    return Container(
        height: size.height * 0.4,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.4 - 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50)
                ),
                image: DecorationImage(
                  image: NetworkImage(posterPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Rating Box
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    width: size.width * 0.9,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: anyaWhiteColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 50,
                              color: anyaBlackColor
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: anyaFillStarColor,
                            ),
                            const SizedBox(height: anyaDefaultPadding / 4),
                            RichText(text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: '${tvListResultObject.voteAverage.toString()}/',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  TextSpan(
                                      text: '10\n'
                                  ),
                                  TextSpan(
                                    text: '${tvListResultObject.voteCount.toString()}',
                                    style: TextStyle(color: Colors.black26),
                                  )
                                ]
                            ))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star_border_outlined),
                            SizedBox(height: anyaDefaultPadding / 4),
                            Text(tvListResultObject.popularity.toString(),
                                style: Theme.of(context).textTheme.bodyText2
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Color(0xff51cf66),
                                    borderRadius: BorderRadius.circular(2)
                                ),
                                child: Text(tvListResultObject.originCountry.join(', '),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500
                                    )
                                )
                            ),
                            SizedBox(height: anyaDefaultPadding / 4),
                            Text(tvListResultObject.originCountry.join(', '),
                                style: Theme.of(context).textTheme.bodyText2
                            )
                          ],
                        )
                      ],
                    )
                )
            ),
            // Back Button
            SafeArea(
              child: Container(
                child: BackButton(),
                padding: EdgeInsets.only(
                  left: 10
                ),
              )
            ),
          ],
        )
    );
  }
}
