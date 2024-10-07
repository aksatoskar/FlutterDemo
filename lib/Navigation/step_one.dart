import 'package:firstflutterapp/Navigation/text_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';

class StepOne extends StatefulWidget {
  const StepOne({required this.onTap, super.key});

  final ValueChanged<String> onTap;

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  int _selectedChoiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textCubit = context.read<TextCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.profileBottomNavigationBarItemLabel,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: BlocBuilder<TextCubit, String>(
        builder: (context, text) {
          final TextEditingController controller =
              TextEditingController(text: text);

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      // filled: true,
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corner border
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        textCubit.updateText(controller.text);
                        widget.onTap(controller.text);
                      },
                      child: Text('Step 2')),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).goNamed('step4');
                      },
                      child: Text('Step 4 Sliver')),

                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).goNamed('step5');
                      },
                      child: Text('Step 5 Sliver')),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      ChoiceChip(
                          label: const Text("choice 1"),
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          selected: _selectedChoiceIndex == 0,
                          selectedColor: Colors.green,
                          backgroundColor: Colors.blue,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedChoiceIndex = 0;
                            });
                          }),
                      ChoiceChip(
                          label: const Text("choice 2"),
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          selected: _selectedChoiceIndex == 1,
                          selectedColor: Colors.green,
                          backgroundColor: Colors.blue,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedChoiceIndex = 1;
                            });
                          }),
                      ChoiceChip(
                          label: const Text("choice 3"),
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          selected: _selectedChoiceIndex == 2,
                          selectedColor: Colors.green,
                          backgroundColor: Colors.blue,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedChoiceIndex = 2;
                            });
                          }),
                    ],
                  ),

                  Stack(
                    children: [
                      // The red container as the base
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                        child: Stack(
                          children: [
                            // Black container in the top-left of the red container
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.black,
                              ),
                            ),

                            // Blue container in the top-right of the red container
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.blue,
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Yellow container aligned to the bottom-center (outside red)

                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
