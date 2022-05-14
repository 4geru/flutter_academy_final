import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_study_day7/model/simple_tv_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryProvider with ChangeNotifier {
  HistoryProvider() {
    _loadHistory();
  }

  List<SimpleTvObject> histories = [];

  void _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> object = prefs.getStringList('histories') ?? [];
    histories = object.map((str) => SimpleTvObject.fromString(str)).toList();
  }

  void insert(SimpleTvObject simpleTvObject) async {
    final prefs = await SharedPreferences.getInstance();
    // 履歴は10件まで登録する
    histories.removeRange(0, max(histories.length - 9, 0));
    List<int> historyTvIds = histories.map((e) => e.id).toList();
    // 履歴にない場合は、追加する
    if(!historyTvIds.contains(simpleTvObject.id)) {
      histories.add(simpleTvObject);
      prefs.setStringList('histories', histories.map((e) => e.toString()).toList());
      notifyListeners();
    }
  }
}
