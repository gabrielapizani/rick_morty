import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;

  const CharacterImage({
    required this.image,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(image),
    );
  }
}
