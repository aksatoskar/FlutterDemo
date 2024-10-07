import 'package:firstflutterapp/Navigation/my_sliver_header_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepFive extends StatelessWidget {

  const StepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
          delegate: MySliverHeaderDelegate(
              maxHeight: 200,
              minHeight: 100,
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('My header'),
                ),
              )),
          pinned: true,
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
          childCount: 100
        ))
      ]),
    );
  }
}
