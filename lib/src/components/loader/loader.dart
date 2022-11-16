import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const Loader({
    Key? key,
    this.size = 30,
    this.strokeWidth = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: const AlwaysStoppedAnimation<Color>(
          Colors.blue,
        ),
      ),
    );
  }
}
