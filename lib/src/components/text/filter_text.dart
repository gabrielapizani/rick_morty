import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterText extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const FilterText({
    required this.text,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 3.0,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
          hintText: text,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(
                  0xFF02b1c6,
                ),
              )),
        ),
      ),
    );
  }
}
