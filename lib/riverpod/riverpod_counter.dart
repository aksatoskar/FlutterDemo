import 'package:firstflutterapp/riverpod/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodCounter extends ConsumerWidget {
  const RiverpodCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);

    return Scaffold(
      body: Center(
          child: Text(counter.toString()),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
              onPressed: () {
                ref.read(counterNotifierProvider.notifier).increment();
              },
              child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).decrement();
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }

}