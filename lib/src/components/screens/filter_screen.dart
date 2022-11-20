import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final VoidCallback onTap;

  const FilterScreen({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
        top: 24.0,
      ),
      child: Container(
        child: (TextField()),
      ),
    );
  }
}
