import 'package:flutter/material.dart';

import '../../../components/error_image_container.dart';
import '../../../model/aggregate_credit_object.dart';
import '../../../theme.dart';

class CastCard extends StatelessWidget {
  const CastCard({Key? key, required this.cast}) : super(key: key);
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(anyaDefaultPadding / 4),
      width: 110,
      child: Card(
        child: Column(
          children: <Widget>[
            const SizedBox(height: anyaDefaultPadding / 2),
            SizedBox(
              height: 100,
              child: Image.network(
                'https://image.tmdb.org/t/p/w300/${cast.profilePath}',
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return const ErrorImageContainer();
                },
              ),
            ),
            const SizedBox(height: anyaDefaultPadding / 2),
            Text(
              cast.originalName ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 2,
            ),
            const SizedBox(height: anyaDefaultPadding / 4),
            Text(cast.roles?.first.character ?? '',
                maxLines: 1, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
