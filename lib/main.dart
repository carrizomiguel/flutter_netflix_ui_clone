import 'package:flutter/material.dart';
import 'package:netflix_ui/ui/content/views/screens/content_nav_screen.dart';
import 'package:netflix_ui/ui/widgets/responsive/responsive.dart';

void main() {
  runApp(
    const MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(),
    // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Responsive.isWeb()
          ? const Color(0xFF141414)
          : Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const ContentNavScreen(),
      // Device Preview Config
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
    );
  }
}
