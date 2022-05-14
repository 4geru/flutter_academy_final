import 'package:flutter/material.dart';
import 'package:flutter_study_day7/model/aggregate_credit_object.dart';
import 'package:flutter_study_day7/model/tv_detail_result_object.dart';
import 'package:flutter_study_day7/model/tv_list_result_object.dart';
import 'package:flutter_study_day7/service/tmdb_api_service.dart';

class UseDetailPage with ChangeNotifier {
  late TvListResultObject tvListResultObject;
  TvDetailResultObject? tvDetailResultObject;
  AggregateCreditObject? aggregateCreditObject;
  UseDetailPage(this.tvListResultObject);

  bool isLoading() {
    return tvDetailResultObject == null;
  }

  Future loading() async {
    await TmdbApiService().getTv(tvListResultObject.id).then((value) => tvDetailResultObject = value);
    loadingAggregateCredit();
    notifyListeners();
  }

  Future loadingAggregateCredit() async {
    await TmdbApiService().getAggregateCredits(tvListResultObject.id).then((value) => aggregateCreditObject = value);
    print(aggregateCreditObject?.cast?.map((v) => v.originalName).toList().join((', ')));
  }
}
