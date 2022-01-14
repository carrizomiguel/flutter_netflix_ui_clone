import 'package:flutter/material.dart';
import 'package:netflix_ui/core/fake_data/data.dart';
import 'package:netflix_ui/ui/content/home/views/widgets/home_widgets.dart';

class WebHomeView extends StatefulWidget {
  const WebHomeView({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  State<WebHomeView> createState() => _WebHomeViewState();
}

class _WebHomeViewState extends State<WebHomeView> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(widget.screenWidth, 60),
        child: WebCustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            WebHeaderPreview(
              featuredContent: breakingBadContent,
            ),
            Column(
              children: [
                SizedBox(height: size.width * 0.45),
                SectionsList(
                  key: const PageStorageKey('trending'),
                  sectionTitle: 'Trending',
                  list: trending,
                ),
                SectionsList(
                  key: const PageStorageKey('originals'),
                  sectionTitle: 'Netflix Originals',
                  list: originals,
                  isOriginals: true,
                ),
                TopList(
                  key: const PageStorageKey('top'),
                  topList: top,
                ),
                SectionsList(
                  key: const PageStorageKey('my-list'),
                  sectionTitle: 'My List',
                  list: myList,
                ),
                SectionsList(
                  key: const PageStorageKey('action'),
                  sectionTitle: 'Action',
                  list: myList,
                ),
                SectionsList(
                  key: const PageStorageKey('sci-fi'),
                  sectionTitle: 'Sci-Fi',
                  list: myList,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
