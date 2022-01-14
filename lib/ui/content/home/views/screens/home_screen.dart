import 'package:flutter/material.dart';
import 'package:netflix_ui/ui/content/home/views/screens/views/mobile_home_view.dart';
import 'package:netflix_ui/ui/content/home/views/screens/views/web_home_view.dart';
import 'package:netflix_ui/ui/widgets/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView(key: PageStorageKey('home'));
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = Responsive.isWeb();
    return Responsive(
      web: WebHomeView(
        screenWidth: screenWidth,
      ),
      mobile: MobileHomeView(
        isWeb: isWeb,
      ),
    );
  }
}
