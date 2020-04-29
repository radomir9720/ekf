import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  CustomFlatButton({this.buttonTitle, this.onPressed});

  final String buttonTitle;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: TextStyle(fontSize: 18.0),
      ),
      color: Colors.teal,
      minWidth: double.infinity,
      height: 40.0,
      elevation: 10.0,
    );
  }
}
