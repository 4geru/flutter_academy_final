import 'package:flutter/material.dart';

import '../../model/aggregate_credit_object.dart';
import '../../model/tv_detail_result_object.dart';
import '../../model/tv_watch_prodvider_result_object.dart';
import '../../service/tmdb_api_service.dart';

class UseDetailPage with ChangeNotifier {
  TvDetailResultObject? tvDetailResultObject;
  AggregateCreditObject? aggregateCreditObject;
  TvWatchProviderResultObject? tvWatchProviderResultObject;

  Future fetch(int tvId, String language) async {
    tvDetailResultObject = null;
    aggregateCreditObject = null;
    tvWatchProviderResultObject = null;

    await TmdbApiService(language: language)
        .getTv(tvId)
        .then((value) => tvDetailResultObject = value);
    await TmdbApiService(language: language)
        .getAggregateCredits(tvId)
        .then((value) => aggregateCreditObject = value);
    await TmdbApiService(language: language)
        .getTvProvider(tvId)
        .then((value) => tvWatchProviderResultObject = value);
    // loading view を表示するために 1秒待たせる
    await Future.delayed(const Duration(seconds: 1));

    notifyListeners();
  }

  bool isLoading() {
    return tvDetailResultObject == null ||
        aggregateCreditObject == null ||
        tvWatchProviderResultObject == null;
  }
}
