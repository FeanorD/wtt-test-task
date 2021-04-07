import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  GradientButton({
    Key key,
    this.gradient,
    this.onPressed,
  }) : super(key: key);

  final Gradient gradient;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      child: Ink(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: gradient,
        ),
        child: Text(
          'Log in',
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
