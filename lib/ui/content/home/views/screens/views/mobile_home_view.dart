import 'package:flutter/material.dart';
import 'package:netflix_ui/core/fake_data/data.dart';
import 'package:netflix_ui/ui/content/home/views/widgets/home_widgets.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({
    Key? key,
    required this.isWeb,
  }) : super(key: key);

  final bool isWeb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: [
            const MobileCustomAppBar(),
            SliverToBoxAdapter(
              child: SectionsList(
                key: const PageStorageKey('trending'),
                sectionTitle: 'Trending',
                list: trending,
              ),
            ),
            SliverToBoxAdapter(
              child: SectionsList(
                key: const PageStorageKey('originals'),
                sectionTitle: 'Netflix Originals',
                list: originals,
                isOriginals: true,
              ),
            ),
            SliverToBoxAdapter(
              child: TopList(
                key: const PageStorageKey('top'),
                topList: top,
              ),
            ),
            SliverToBoxAdapter(
              child: SectionsList(
                key: const PageStorageKey('my-list'),
                sectionTitle: 'My List',
                list: myList,
              ),
            ),
            SliverToBoxAdapter(
              child: SectionsList(
                key: const PageStorageKey('action'),
                sectionTitle: 'Action',
                list: myList,
              ),
            ),
            SliverToBoxAdapter(
              child: SectionsList(
                key: const PageStorageKey('sci-fi'),
                sectionTitle: 'Sci-Fi',
                list: myList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
