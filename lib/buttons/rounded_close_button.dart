import 'package:flutter/material.dart';

class RoundedCloseButton extends StatelessWidget {
  const RoundedCloseButton({super.key, required this.onPress});

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(),
      onPressed: () => onPress(),
      elevation: 0,
      fillColor: const Color(0xffF5F5F5),
      padding: const EdgeInsets.all(5.0),
      shape: const CircleBorder(),
      child: const Icon(
        Icons.close,
        color: Color(0xFF22222B),
        size: 20.0,
      ),
    );
  }
}
