import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step Three',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Container(
        height: 100,
        width: 100,
        color: Colors.yellow,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/step1');
              },
              child: Text('Step 1')),
        ),
      )
    );
  }
}


/*
Center(
child: ElevatedButton(
onPressed: () {
GoRouter.of(context).goNamed('/step1');
},
child: Text('Step 1')),
),*/
