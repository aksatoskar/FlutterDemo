import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StepTwo extends StatelessWidget {
  final String item;

  const StepTwo({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step Two',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed('step3');
            },
            child: Text('Step 3 ${item}')),
      ),
    );
  }
}
