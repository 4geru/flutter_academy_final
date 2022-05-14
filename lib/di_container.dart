import 'package:flutter_study_day7/data/repo/history_provider.dart';
import 'package:flutter_study_day7/page/details/hooks.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HistoryProvider());
  sl.registerFactory(() => UseDetailPage());
}
