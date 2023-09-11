import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? buttonColor;
  final String? item;
  final VoidCallback onPressed;
  final Icon? icon;

  const Button({super.key, this.buttonColor, this.item, this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(72, 72),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: buttonColor?? Colors.white,
      ),
      onPressed: onPressed,
      child: Center(
        child: item != null
            ? Text(
                item!,
                style: TextStyle(fontSize: 28, color: buttonColor == Colors.blue? Colors.white : Colors.black),
              )
            : icon ?? const Text('Text'),
      ),
    );
  }
}
