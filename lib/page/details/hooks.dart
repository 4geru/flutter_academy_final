import 'package:flutter/material.dart';
import '../../model/aggregate_credit_object.dart';
import '../../model/tv_detail_result_object.dart';
import '../../service/tmdb_api_service.dart';

class UseDetailPage with ChangeNotifier {
  TvDetailResultObject? tvDetailResultObject;
  AggregateCreditObject? aggregateCreditObject;
  UseDetailPage();

  Future fetch(int tvId) async {
    tvDetailResultObject = null;
    aggregateCreditObject = null;

    await TmdbApiService().getTv(tvId).then((value) => tvDetailResultObject = value);
    await TmdbApiService()
        .getAggregateCredits(tvId)
        .then((value) => aggregateCreditObject = value);
    // loading view を表示するために 1秒待たせる
    await Future.delayed(const Duration(seconds: 1));

    notifyListeners();
  }

  bool isLoading() {
    return tvDetailResultObject == null || aggregateCreditObject == null;
  }
}
