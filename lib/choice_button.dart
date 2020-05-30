import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoiceButton extends RaisedButton {
  final GestureTapCallback onPressed;
  final Color color;
  final Color splashColor;
  final Widget child;

  ChoiceButton({
    @required this.onPressed,
    this.color,
    this.splashColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: color,
      splashColor: splashColor,
      child: child,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
    );
  }
}
