import 'package:flutter/material.dart';
import 'package:flutter_study_day7/data/repo/theme_provider.dart';
import 'package:provider/provider.dart';

import 'page/root/top_page.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: anyaWhiteColor,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: anyaColor)
              .copyWith(secondary: anyaSecondaryColor),
          tabBarTheme: const TabBarTheme(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: anyaselectedColor)),
          ),
          textTheme: TextTheme()),
      darkTheme: ThemeData.dark().copyWith(
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(selectedItemColor: anyaColor)),
      themeMode: Provider.of<ThemeProvider>(context).current,
      routes: <String, WidgetBuilder>{'/': (context) => const TopHomePage()},
      debugShowCheckedModeBanner: false,
    );
  }
}
