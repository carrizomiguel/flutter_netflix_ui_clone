import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/ui/content/bloc/content_navigation_bloc.dart';
import 'package:netflix_ui/ui/content/home/views/screens/home_screen.dart';
import 'package:netflix_ui/ui/content/views/widgets/bottom_nav_bar.dart';
import 'package:netflix_ui/ui/widgets/responsive/responsive.dart';

class ContentNavScreen extends StatelessWidget {
  const ContentNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContentNavigationBloc(),
      child: const ContentNavView(),
    );
  }
}

class ContentNavView extends StatelessWidget {
  const ContentNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentNavigationBloc, ContentNavigation>(
      builder: (context, view) {
        return Scaffold(
          body: _buildScreen(view),
          bottomNavigationBar: Responsive.isWeb()
            ? null
            : BottomNavBar(
              currentView: view,
            ),
        );
      },
    );
  }

  _buildScreen(ContentNavigation view) {
    switch (view) {
      case ContentNavigation.home:
        return const HomeScreen();
      case ContentNavigation.comingSoon:
        return const Scaffold();
      case ContentNavigation.downloads:
        return const Scaffold();
    }
  }
}
