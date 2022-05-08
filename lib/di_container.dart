import 'package:flutter_study_day7/data/repo/history_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  print('called');
  sl.registerFactory(() => HistoryProvider());
}
