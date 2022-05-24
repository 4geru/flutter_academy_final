import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'data/repo/history_provider.dart';
import 'data/repo/locale_provider.dart';
import 'data/repo/theme_provider.dart';
import 'di_container.dart' as di;
import 'page/details/hooks.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: 'assets/.env');
  await di.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<HistoryProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LocaleProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<UseDetailPage>()),
  ], child: App()));
}
