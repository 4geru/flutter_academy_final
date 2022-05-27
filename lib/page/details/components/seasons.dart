import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/error_image_container.dart';
import '../../../data/repo/locale_provider.dart';
import '../../../model/tv_detail_result_object.dart';
import '../../../theme.dart';

class Seasons extends StatefulWidget {
  const Seasons({Key? key, required this.seasons, required this.year})
      : super(key: key);
  final int year;
  final List<Season> seasons;

  @override
  State<Seasons> createState() => _SeasonsState();
}

class _SeasonsState extends State<Seasons> {
  bool _openSeason = true;

  @override
  Widget build(BuildContext context) {
    final l10n = Provider.of<LocaleProvider>(context).load();

    return Column(
      children: [
        Card(
          child: ListTile(
              title: Text(l10n.detail_season),
              trailing: _openSeason
                  ? const Icon(Icons.arrow_drop_up)
                  : const Icon(Icons.arrow_drop_down),
              onTap: () => setState(() => _openSeason = !_openSeason)),
        ),
        if (_openSeason)
          ...(widget.seasons).map((season) {
            final openDate =
                '${season.airDate?.year}年${season.airDate?.month}月${season.airDate?.day}日 | ';
            return Card(
              child: ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w300/${season.posterPath}',
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return const ErrorImageContainer();
                    },
                  ),
                  title: Text(season.name),
                  subtitle: Column(
                    children: [
                      Row(children: [
                        if (widget.year == season.airDate?.year)
                          const Icon(Icons.favorite,
                              color: anyaSecondaryColor, size: 24.0),
                        Text(
                            "${season.airDate != null ? openDate : ''}${season.episodeCount}話"),
                      ]),
                      Text(
                        season.overview ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
            );
          }),
      ],
    );
    // return ;
  }
}
