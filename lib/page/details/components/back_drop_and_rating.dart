import 'package:flutter/material.dart';

import '../../../model/tv_detail_result_object.dart';
import '../../../theme.dart';

class BackDropAndRating extends StatelessWidget {
  final TvDetailResultObject tvDetailResultObject;
  const BackDropAndRating({Key? key, required this.tvDetailResultObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final posterPath =
        'https://image.tmdb.org/t/p/original/${tvDetailResultObject.backdropPath}';
    return SizedBox(
        height: size.height * 0.4,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.4 - 50,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(50)),
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
                    decoration: BoxDecoration(
                        // TODO: dark <> light
                        color: Colors.grey[800],
                        // color: anyaWhiteColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 50,
                              color: anyaBlackColor)
                        ]),
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
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text:
                                    '${tvDetailResultObject.voteAverage.toString()}/',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const TextSpan(text: '10\n'),
                              TextSpan(
                                text: tvDetailResultObject.voteCount.toString(),
                              )
                            ]))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(Icons.person_add_alt_1),
                            const SizedBox(height: anyaDefaultPadding / 4),
                            Text(tvDetailResultObject.popularity.toString(),
                                style: Theme.of(context).textTheme.bodyText2)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff51cf66),
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                        tvDetailResultObject.originCountry
                                            .join(', '),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500))),
                                const SizedBox(width: anyaDefaultPadding / 4),
                                Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff51cf66),
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Text(
                                        tvDetailResultObject.originCountry
                                            .join(', '),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500))),
                              ],
                            )
                          ],
                        )
                      ],
                    ))),
            // Back Button
            SafeArea(
                child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: const BackButton(),
            )),
          ],
        ));
  }
}
