import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_study_day7/data/repo/history_provider.dart';
import 'package:flutter_study_day7/page/details/hooks.dart';
import 'package:flutter_study_day7/page/root/top_page.dart';
import 'package:flutter_study_day7/theme.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: "assets/.env");
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<HistoryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<UseDetailPage>()),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: anyaWhiteColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: anyaColor).copyWith(secondary: anyaSecondaryColor),
        tabBarTheme: const TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: anyaselectedColor
          )
        ),
      ),
    ),
    routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const TopHomePage()
      },
      debugShowCheckedModeBanner: false,
    ))
  );
}

