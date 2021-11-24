import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  String? buttonText;
  final void Function()? onPressed;
  //By the way VoidCallback is just shorthand for void Function() so you could also define it as final void Function() onPressed;

  SubmitButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.pink[400],
        child: Text(
          buttonText!,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed);
  }
}
