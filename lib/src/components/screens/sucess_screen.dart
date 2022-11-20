import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_morty/src/components/text/pattern_text.dart';

class SuccessScreen extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const SuccessScreen({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
        top: 24.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 120.0,
                    bottom: 40.0,
                  ),
                  child: Icon(
                    FontAwesomeIcons.check,
                    size: 50,
                    color: Color(0xFF88bc65),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PatternText(
                      text: widget.text,
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ConstrainedBox(
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
              onPressed: widget.onTap,
              child: const PatternText(
                text: 'Voltar',
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
