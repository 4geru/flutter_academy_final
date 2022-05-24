import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/simple_tv_object.dart';

class HistoryProvider with ChangeNotifier {
  HistoryProvider() {
    loadHistory();
  }

  List<SimpleTvObject> histories = [];

  Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final object = prefs.getStringList('histories') ?? [];
    histories = object.map((str) => SimpleTvObject.fromString(str)).toList();
  }

  Future<void> insert(SimpleTvObject simpleTvObject) async {
    final prefs = await SharedPreferences.getInstance();
    // 履歴は10件まで登録する
    histories.removeRange(0, max(histories.length - 9, 0));
    final historyTvIds = histories.map((e) => e.id).toList();
    // 履歴にない場合は、追加する
    if (!historyTvIds.contains(simpleTvObject.id)) {
      histories.add(simpleTvObject);
      await prefs.setStringList(
          'histories', histories.map((e) => e.toString()).toList());
      notifyListeners();
    }
  }
}
