import 'package:flutter/material.dart';
import 'package:netflix_ui/ui/widgets/responsive/responsive.dart';

class SectionsTitle extends StatelessWidget {
  const SectionsTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isWeb() ? size.width * .035 : 25,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: Responsive.isWeb() ? size.width * .018 : 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}