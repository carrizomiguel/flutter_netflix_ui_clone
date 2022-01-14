import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
    required this.web,
  }) : super(key: key);

  final Widget mobile;
  final Widget web;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static bool isWeb() => kIsWeb;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isWeb() || constraints.maxWidth >= 1200) {
          return web;
        } else {
          return mobile;
        }
      },
    );
  }
}
