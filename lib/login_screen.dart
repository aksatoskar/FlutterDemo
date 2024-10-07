


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight
                  ),
                ),

                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}