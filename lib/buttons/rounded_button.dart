import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.btnTitle,
      required this.bgColor,
      required this.textColor,
      this.width,
      this.fontSize = 16.0,
      this.padding = 13.0,
      required this.onPress,
      this.fontWeight = FontWeight.w900,
      this.height = 53});

  final String btnTitle;
  final Color bgColor;
  final Color textColor;
  final Function? onPress;
  final double fontSize;
  final double padding;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      onPressed: () => onPress != null ? onPress!() : null,
      minWidth: (MediaQuery.of(context).size.width) /
          (width == null ? 0 : width!),
      padding: EdgeInsets.all(padding),
      colorBrightness: Brightness.dark,
      color: onPress != null ? bgColor : const Color(0xFFC4C4C4),
      elevation: 1.0,
      highlightElevation: 1.0,
      shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(30)),
      child: Text(
        btnTitle,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
