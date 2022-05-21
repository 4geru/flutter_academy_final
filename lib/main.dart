import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'data/repo/history_provider.dart';
import 'di_container.dart' as di;
import 'page/details/hooks.dart';
import 'page/root/top_page.dart';
import 'theme.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: 'assets/.env');
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
        '/': (context) => const TopHomePage()
      },
      debugShowCheckedModeBanner: false,
    ))
  );
}

