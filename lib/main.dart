import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/page/details/detail_page.dart';
import 'package:flutter_study_day7/page/root/top_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: "assets/.env");
  runApp(MaterialApp(
    title: 'Flutter Demo',
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => TopHomePage(title: 'Flutter Demo Home Page'),
      '/details/:id': (BuildContext context) => DetailPage(),
    }
  ));
}

