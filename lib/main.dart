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
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(
        0xFFFFCEE4,
        <int, Color> {
          50: Color(0xFFFFEBF4),
          100: Color(0xFFFFCEE4),
          200: Color(0xFFFFC2DD),
          300: Color(0xFFFFADD2),
          400: Color(0xFFFF99C7),
          500: Color(0xFFFF85BC),
          600: Color(0xFFFF70B0),
          700: Color(0xFFFF5CA5),
          800: Color(0xFFFF479A),
          900: Color(0xFFFF338F),
        }
      )).copyWith(secondary: Color(0xFFFF9BC8)),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xFFFF338F)
        )
      ),
    ),
  ),
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => TopHomePage(title: 'Flutter Demo Home Page'),
      '/details/:id': (BuildContext context) => DetailPage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

