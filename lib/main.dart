import 'package:flutter/material.dart';
import 'package:main/popup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MaterialApp(
      home: MainScreen(),
    ));

class MyCheckBox extends StatefulWidget {
  MyCheckBox({super.key});
  State<MyCheckBox> createState() => _CheckBox();
}

class _CheckBox extends State<MyCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        });
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 125, 125, 1),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          optionDialog(context);
                        },
                        icon: Icon(Icons.settings)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/helpIcon.png'))
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 2,
              child: Center(
                  child: Container(
                constraints: BoxConstraints(minWidth: 200),
                child: Image.asset('assets/main_logo.png', fit: BoxFit.contain),
              )),
            ),
            Spacer(
              flex: 2,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Container(
                constraints: BoxConstraints(minHeight: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'assets/joinButton.png',
                        width: 250,
                        height: 50,
                      ),
                      onTap: (() => joinRoomDialog(context)),
                    ),
                    InkWell(
                      child: Image.asset(
                        'assets/creatButton.png',
                        width: 250,
                        height: 50,
                      ),
                      onTap: (() => createRoomDialog(context)),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
