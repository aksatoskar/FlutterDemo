import 'package:firstflutterapp/stream/counter_controller.dart';
import 'package:flutter/material.dart';

class CounterStream extends StatelessWidget {
  final CounterController counterController = CounterController();

  CounterStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steam Counter'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                counterController.eventSink.add(Event.INCREMENT);
              }),

          FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                counterController.eventSink.add(Event.DECREMENT);
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
                stream: counterController.counterStream,
                initialData: 0,
                builder: (context, asyncShot) {
                  return Text(asyncShot.data.toString());
                }),

            StreamBuilder(
                stream: counterController.counterStream,
                initialData: 0,
                builder: (context, asyncShot) {
                  return Text(asyncShot.data.toString());
                }),
          ],
        ),
      ),
    );
  }
}
