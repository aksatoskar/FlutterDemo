import 'package:firstflutterapp/Navigation/text_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';

class StepOneNew extends StatefulWidget {
  const StepOneNew({super.key});

  @override
  State<StepOneNew> createState() => _StepOneState();
}

class _StepOneState extends State<StepOneNew> {
  int number = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    increment();
    increment();
    increment();
  }

  void increment() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$number'),

            ElevatedButton(onPressed: increment, child: const Text('hit'))
          ],
        )
      ),
    );
  }
}

