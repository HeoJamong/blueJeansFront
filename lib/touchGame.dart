import 'dart:developer';

import 'package:main/waitRoom.dart';
import 'package:main/waitRoomUser.dart';
import 'package:flutter/material.dart';

class TouchGame {
  var touchCnt;
  int get getTouchCnt => touchCnt;
  set setTouchCnt(int cnt) => touchCnt = cnt;
}

class TouchCounter extends StatefulWidget {
  // This class is the configuration for the state.
  // It holds the values (in this case nothing) provided
  // by the parent and used by the build  method of the
  // State. Fields in a Widget subclass are always marked
  // "final".

  const TouchCounter({super.key});

  @override
  State<TouchCounter> createState() => _TouchCount();
}

class _TouchCount extends State<TouchCounter> {
  int _counter = 0;

  void _increment() {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pop(context);
    });
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          //onPressed: _increment,
          onTap: _increment,
          //onPressed: _increment,
          child: Image.asset(
            'assets/touchButton.png',
            width: 300,
            height: 300,
          ),
        ),
        const SizedBox(width: 14),
        Text('Count: $_counter'),
      ],
    );
  }
}
