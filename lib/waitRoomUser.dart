import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main/main.dart';

class WaitRoomUserScreen extends StatelessWidget {
  @override
  var isChecked = false;

  WaitRoomUserScreen(BuildContext context);
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(1, 125, 125, 1),
        // ignore: prefer_const_constructors
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 40),
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        height: 40,
                        child: Text("방 코드",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Text(testRandom(),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center)),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 5),
                        color: Colors.yellowAccent),
                    width: 300,
                    height: 200,
                    child: Text(
                      "참가자",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 5),
                        color: Colors.yellowAccent),
                    width: 300,
                    height: 200,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Square("랜덤"),
                              Square("터치 게임"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Square("폭탄돌리기"),
                              Square("밸런스게임"),
                            ],
                          ),
                        ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                      child: Text(
                        "나가기",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (__) => MainScreen()));
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

class Square extends StatelessWidget {
  @override
  String game;

  Square(this.game) {}

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 10),
      child: Container(
        width: 80,
        height: 40,
        //color: Colors.yellow,
        child: Text(
          game,
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

String testRandom() {
  var random = Random();
  dynamic val = List<int>.generate(6, (i) => random.nextInt(100));

  return base64UrlEncode(val);
}
