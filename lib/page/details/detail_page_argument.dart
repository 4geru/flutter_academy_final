import 'package:flutter_study_day7/model/tv_list_result_object.dart';

class DetailPageArgument {
  final int tvId;
  final int? year;
  final TvListResultObject tvListResultObject;
  DetailPageArgument({ required this.tvId, required this.tvListResultObject, this.year });
}
