import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepFour extends StatefulWidget {
  const StepFour({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StepFourState();
  }
}

class _StepFourState extends State<StepFour> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
              title: Text('My App'),
              pinned: true,
          ),

          SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,
              int index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
              childCount: 100

          ),),
        ],
      ),
    );
  }
}