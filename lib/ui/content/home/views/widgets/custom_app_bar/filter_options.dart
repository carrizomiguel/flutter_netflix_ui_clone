import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }
}