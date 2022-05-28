import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/theme_provider.dart';
import '../../../model/tv_detail_result_object.dart';
import '../../../model/tv_watch_prodvider_result_object.dart';
import '../../../theme.dart';

class BackDropAndRating extends StatelessWidget {
  const BackDropAndRating(
      {Key? key,
      required this.tvDetailResultObject,
      required this.tvWatchProviderResultObject})
      : super(key: key);
  final TvDetailResultObject tvDetailResultObject;
  final TvWatchProviderResultObject tvWatchProviderResultObject;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final posterPath =
        'https://image.tmdb.org/t/p/original/${tvDetailResultObject.backdropPath}';
    final fontColor = Provider.of<ThemeProvider>(context, listen: false).isDark
        ? anyaWhiteColor
        : Colors.grey[800];
    final providreList =
        tvWatchProviderResultObject.results.jp?.flatrate?.map((element) {
              return {
                'providerName': element.providerName,
                'logoPath': element.logoPath
              };
            }) ??
            [];
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
                        color:
                            Provider.of<ThemeProvider>(context, listen: false)
                                    .isDark
                                ? Colors.grey[800]
                                : anyaWhiteColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                        boxShadow: const [
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
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: fontColor),
                              ),
                              TextSpan(
                                  text: '10\n',
                                  style: TextStyle(
                                    color: fontColor,
                                  )),
                              TextSpan(
                                  text:
                                      tvDetailResultObject.voteCount.toString(),
                                  style: TextStyle(
                                    color: fontColor,
                                  ))
                            ]))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(Icons.person_add_alt_1),
                            const SizedBox(height: anyaDefaultPadding / 4),
                            Text(tvDetailResultObject.popularity.toString(),
                                style: TextStyle(
                                  color: fontColor,
                                ))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                ...providreList.map((element) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w300/${element['logoPath']}',
                                        ),
                                      ),
                                      const SizedBox(
                                          width: anyaDefaultPadding / 4),
                                    ],
                                  );
                                })
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
