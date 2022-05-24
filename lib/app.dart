import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import './page/root/top_page.dart';
import 'data/repo/theme_provider.dart';
import 'theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context).loadTheme();
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
      ],
      theme: ThemeData(
          scaffoldBackgroundColor: anyaWhiteColor,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: anyaColor)
              .copyWith(secondary: anyaSecondaryColor),
          tabBarTheme: const TabBarTheme(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: anyaselectedColor)),
          ),
          textTheme: const TextTheme()),
      darkTheme: ThemeData.dark().copyWith(
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(selectedItemColor: anyaColor)),
      themeMode: Provider.of<ThemeProvider>(context).current,
      routes: <String, WidgetBuilder>{'/': (context) => const TopHomePage()},
      debugShowCheckedModeBanner: false,
    );
  }
}
