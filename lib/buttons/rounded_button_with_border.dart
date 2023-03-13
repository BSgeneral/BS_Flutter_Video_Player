import 'package:flutter/material.dart';

class RoundedBorderButton extends StatelessWidget {
  const RoundedBorderButton(
      {super.key, required this.btnTitle,
      required this.bgColor,
      required this.textColor,
      this.width,
      this.fontSize = 16.0,
      this.padding = 13.0,
      required this.onPress});

  final String btnTitle;
  final Color bgColor;
  final Color textColor;
  final Function? onPress;
  final double fontSize;
  final double padding;
  final double? width;

  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      onPressed: () => onPress != null ? onPress!() : null,
      minWidth: (MediaQuery.of(context).size.width) /
          (width == null ? 0 : width!),
      padding: EdgeInsets.all(padding),
      colorBrightness: Brightness.dark,
      color: onPress != null ? bgColor :const Color(0xFFB7B7B7),
      elevation: 1.0,
      highlightElevation: 1.0,
      shape: RoundedRectangleBorder(
          side:
              BorderSide(color: textColor, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        btnTitle,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: FontWeight.w700),
      ),
    );
  }
}
