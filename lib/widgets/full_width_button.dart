import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color btnTextColor;
  final IconData btnIcon;
  final onBtnPressed;

  const FullWidthButton({
    @required this.btnText,
    @required this.btnColor,
    @required this.btnTextColor,
    @required this.btnIcon,
    @required this.onBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton.icon(
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8),
          child: Text(
            btnText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        textColor: btnTextColor,
        icon: Icon(btnIcon),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: btnColor,
        onPressed: onBtnPressed,
      ),
    );
  }
}
