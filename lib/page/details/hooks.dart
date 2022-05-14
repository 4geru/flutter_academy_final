import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/aggregate_credit_object.dart';
import 'package:flutter_study_day7/model/tv_detail_result_object.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/service/tmdb_api_service.dart';

class UseDetailPage with ChangeNotifier {
  TvDetailResultObject? tvDetailResultObject;
  AggregateCreditObject? aggregateCreditObject;
  UseDetailPage();

  Future fetch(int tvId) async {
    _resetObjects();
    await TmdbApiService().getTv(tvId).then((value) {
      tvDetailResultObject = value;
    });
    await loadingAggregateCredit(tvId);
    print({
      'isloading': isLoading(),
      'tvDetailResultObject': tvDetailResultObject,
      'aggregateCreditObject': aggregateCreditObject,
    });
    // if (isLoading()) {
      notifyListeners();
    // }
  }

  bool isLoading() {
    return tvDetailResultObject == null &&
      aggregateCreditObject == null;
  }

  Future loadingAggregateCredit(int tvId) async {
    await TmdbApiService().getAggregateCredits(tvId).then((value) => aggregateCreditObject = value);
  }

  void _resetObjects() {
    tvDetailResultObject = null;
    aggregateCreditObject = null;
  }
}
