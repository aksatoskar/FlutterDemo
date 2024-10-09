import 'package:firstflutterapp/stream/CounterStream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Navigation/navigation_main.dart';
import 'Navigation/step_one_1.dart';
import 'l10n/app_localizations.dart';
import 'login_screen.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('window size is ${getWindowSize(context)}');
    return MaterialApp(
        title: 'Flutter Demo',
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', 'BR'),
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainPage());
  }

  Size getWindowSize(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size;
  }
}
