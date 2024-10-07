import 'package:firstflutterapp/Navigation/step_five.dart';
import 'package:firstflutterapp/Navigation/step_four.dart';
import 'package:firstflutterapp/Navigation/text_cubit.dart';
import 'package:firstflutterapp/Navigation/step_one.dart';
import 'package:firstflutterapp/Navigation/step_three.dart';
import 'package:firstflutterapp/Navigation/step_two.dart';
import 'package:firstflutterapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class NavigationMain extends StatelessWidget {
  const NavigationMain({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => TextCubit(),
      child: MaterialApp.router(
        title: l10n.profileBottomNavigationBarItemLabel,
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', 'BR'),
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        routerConfig: GoRouter(initialLocation: '/step1', routes: [
          GoRoute(
              path: '/step1',
              builder: (context, state) => StepOne(onTap: (String i) {
                    GoRouter.of(context).goNamed('step2', extra: {'item': i});
                  }),
              routes: [
                GoRoute(
                  name: 'step2',
                  path: 'step2',
                  //path: 'step2',
                  builder: (context, state) {
                  /*  final item = state.extra as Map<String, String>;
                    return StepTwo(item: item['item']!);
*/
                    final item = state.extra != null ? state.extra as Map<String, String> : {};
                    return StepTwo(item: item['item'] ?? '');
                  },
                  routes: [
                    GoRoute(
                      name: 'step3',
                      path: 'step3',
                      builder: (context, state) => const StepThree(),
                    )
                  ]
                ),

                GoRoute(
                  name: 'step4',
                  path: 'step4',
                  builder: (context, state) => const StepFour(),
                ),

                GoRoute(
                  name: 'step5',
                  path: 'step5',
                  builder: (context, state) => const StepFive(),
                )
              ])
        ]),
      ),
    );
  }
}
