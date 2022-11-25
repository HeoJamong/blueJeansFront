import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main/main.dart';

class SecondScreen extends StatelessWidget {
  @override
  var isChecked = false;

  Widget build(BuildContext context) {
    List bbb = ['a', 'b', 'c'];
    print(bbb.length);

    List memberList = member(bbb);
    print(memberList);
    return Scaffold(
        backgroundColor: Color.fromRGBO(1, 125, 125, 1),
        // ignore: prefer_const_constructors
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, left: 40),
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                if (memberList[0] == null)
                                  Square("")
                                else
                                  Square(memberList[0].toString()),
                                Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    )),
                                    child: MyCheckBox()),
                                if (memberList[1] == null)
                                  Square("")
                                else
                                  Square(memberList[1].toString()),
                                Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    )),
                                    child: MyCheckBox()),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                if (memberList[2] == null)
                                  Square("")
                                else
                                  Square(memberList[2].toString()),
                                Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    )),
                                    child: MyCheckBox()),
                                if (memberList[3] == null)
                                  Square("")
                                else
                                  Square(memberList[3].toString()),
                                Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    )),
                                    child: MyCheckBox()),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                if (memberList[4] == null)
                                  Square("")
                                else
                                  Square(memberList[4].toString()),
                                Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    )),
                                    child: MyCheckBox()),
                                if (memberList[5] == null)
                                  Square("")
                                else
                                  Square(memberList[5].toString()),
                                Theme(
                                    data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    )),
                                    child: MyCheckBox()),
                              ],
                            ),
                          ]),
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
                              Square2("랜덤 게임"),
                              Theme(
                                  data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                  )),
                                  child: MyCheckBox()),
                              Square2("터치 게임"),
                              Theme(
                                  data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                  )),
                                  child: MyCheckBox()),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Square2("폭탄게임"),
                              Theme(
                                  data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                  )),
                                  child: MyCheckBox()),
                              Square2("밸런스  게임"),
                              Theme(
                                  data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                  )),
                                  child: MyCheckBox()),
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
                      onPressed: () {},
                      child: Text(
                        "시작",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            //color: Colors.yellow,
            child: Text(
              game,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class Square2 extends StatelessWidget {
  @override
  String game;
  Square2(this.game) {}

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 10),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 40,
            //color: Colors.yellow,
            child: Text(
              game,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

List member(List member) {
  List users = List.filled(6, "");
  //users[0].add("");

  for (int i = 0; i < member.length; i++) {
    users[i] = member[i];
  }
  print(users[1]);
  return users;
}

String testRandom() {
  var random = Random();
  dynamic val = List<int>.generate(6, (i) => random.nextInt(100));
  return base64UrlEncode(val);
}
