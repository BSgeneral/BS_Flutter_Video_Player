import 'package:flutter/material.dart';

class BSCircularButton extends StatelessWidget {
  final Function? onPress;
  final String heroTag;
  final IconData iconData;
  final bool isBackButton;

  const BSCircularButton(
      {super.key,
      required this.heroTag,
      required this.onPress,
      required this.iconData,
      this.isBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          elevation: isBackButton
              ? 4
              : onPress != null
                  ? 4
                  : 0,
          heroTag: heroTag,
          backgroundColor: isBackButton
              ? const Color(0xffF5F5F5)
              : onPress != null
                  ? const Color(0xFF253861)
                  : const Color(0xffF5F5F5),
          child: Icon(
            iconData,
            color: isBackButton
                ? Colors.black
                : onPress != null
                    ? Colors.white
                    : Colors.grey,
          ),
          onPressed: () => onPress != null ? onPress!() : null,
        ),
      ),
    );
  }
}
