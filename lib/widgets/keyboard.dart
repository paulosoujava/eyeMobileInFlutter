import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyBoard extends StatelessWidget {
  String number;
  bool isIcon;

  KeyBoard(this.number, {  bool this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      child: CircleAvatar(
        child: isIcon
            ? Icon(
                Icons.backspace,
                color: Colors.white,
              )
            : Text(
                number,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Din',
                ),
              ),
        backgroundColor: Colors.white10,
      ),
    );
  }
}
