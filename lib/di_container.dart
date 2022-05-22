import 'package:flutter_study_day7/data/repo/theme_provider.dart';
import 'package:get_it/get_it.dart';

import 'data/repo/history_provider.dart';
import 'page/details/hooks.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => ThemeProvider());
  sl.registerFactory(() => UseDetailPage());
  sl.registerFactory(() => HistoryProvider());
}
