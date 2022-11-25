import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main/main.dart';
import 'package:main/touchGame.dart';
import 'package:main/waitRoom.dart';
import 'package:main/waitRoomUser.dart';
//import 'package:fluttertest/socket_io_clnt.dart';
//import 'package:fluttertest/user_class.dart';

//ClientSocket socket = ClientSocket();

String randomRoomId() {
  var random = Random();
  dynamic val = List<int>.generate(6, (i) => random.nextInt(247));
  return base64UrlEncode(val);
}

void roomIdError(BuildContext context) {
  var dialog = Dialog(child: roomIdErrorScreen());
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

void nicknameError(BuildContext context) {
  var dialog = Dialog(child: nicknameErrorScreen());
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

void optionDialog(BuildContext context) {
  var dialog = Dialog(child: OptionScreen());
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

void createRoomDialog(BuildContext context) {
  var dialog = Dialog(child: CreateRoomScreen());
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

void joinRoomDialog(BuildContext context) {
  var dialog = Dialog(child: JoinRoomScreen());
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

void showHelpDialog(BuildContext context) {
  var dialog = Dialog(child: ShowHelpScreen());
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

class nicknameErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/error.png'), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0, top: 50),
        child: Container(
          child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                "별명이 중복 되었습니다.",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}

class roomIdErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/error.png'), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0, top: 50),
        child: Container(
          child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                "방코드가 틀립니다.",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 700,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/option.png'), fit: BoxFit.fill)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 130, left: 190),
          child: Column(
            children: [
              Row(
                children: [MyCheckBox(), MyCheckBox()],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [MyCheckBox(), MyCheckBox()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  CreateRoomScreenState createState() => CreateRoomScreenState();
}

class CreateRoomScreenState extends State<CreateRoomScreen> {
  TextEditingController nicknameTEC = TextEditingController();
  String nickname = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/createRoom.png'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 300.0),
          child: Container(
            child: Column(children: [
              RichText(
                text: TextSpan(text: ""),
              ),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                      controller: nicknameTEC,
                      decoration: InputDecoration(
                          hintText: '닉네임을 입력하세요.',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: Colors.black45,
                                width: 3,
                              ))))),
              Flexible(
                  child: InkWell(
                      child: Image.asset(
                        'assets/confirmButton.png',
                        width: 150,
                        height: 80,
                      ),
                      onTap: (() => roomIdError(context))

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => SecondScreen()));

                      ))
            ]),
          ),
        ));
  }
}

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  JoinRoomScreenState createState() => JoinRoomScreenState();
}

class JoinRoomScreenState extends State<JoinRoomScreen> {
  TextEditingController roomIdTEC = TextEditingController();
  TextEditingController nicknameTEC = TextEditingController();
  String roomId = "";
  String nickname = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/joinRoom.png'), fit: BoxFit.fill),
        ),
        child: Column(children: <Widget>[
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
            ),
          ),
          Flexible(flex: 2, child: Center()),
          Flexible(
            flex: 4,
            child: Container(
              constraints: BoxConstraints(minHeight: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontFamily: 'Retro',
                                fontSize: 20,
                              ),
                              controller: nicknameTEC,
                              decoration: InputDecoration(
                                  hintText: '별명을 입력하세요.',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                        color: Colors.black45,
                                        width: 3,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      ))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontFamily: 'Retro',
                                fontSize: 20,
                              ),
                              controller: roomIdTEC,
                              decoration: InputDecoration(
                                  hintText: '방 코드를 입력하세요.',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                        color: Colors.black45,
                                        width: 3,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      ))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
                child: SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xffc0c0c0),
                    ),
                    shape: MaterialStateProperty.all(
                      BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(
                            width: 2,
                            color: Colors.black,
                            style: BorderStyle.solid),
                      ),
                    )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (__) => TouchCounter()));
                  // builder: (__) => WaitRoomUserScreen(context)));
                  nickname = nicknameTEC.text;
                  roomId = roomIdTEC.text;
                  print(nickname);
                  print(roomId);

                  //var data =
                  //    User(name: nickname, roomid: roomId, isHead: false);
                  // socket.connect('join', data);
                },
                child: Text(
                  '입장',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Retro',
                    fontSize: 25,
                  ),
                ),
              ),
            )),
          ),
        ]));
  }
}

class ShowHelpScreen extends StatelessWidget {
  const ShowHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
