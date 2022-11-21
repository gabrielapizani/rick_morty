import 'package:flutter/material.dart';

import '../text/pattern_text.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 48.0,
        minWidth: 240.0,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(
              0xFF02b1c6,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: PatternText(
          text: text,
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
