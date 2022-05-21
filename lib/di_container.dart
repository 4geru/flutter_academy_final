import 'package:get_it/get_it.dart';

import 'data/repo/history_provider.dart';
import 'page/details/hooks.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HistoryProvider());
  sl.registerFactory(() => UseDetailPage());
}
