import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_ui/ui/content/home/models/content_model.dart';
import 'package:netflix_ui/ui/content/home/views/widgets/list_items/default_list_item.dart';
import 'package:netflix_ui/ui/content/home/views/widgets/sections/sections_title.dart';
import 'package:netflix_ui/ui/widgets/responsive/responsive.dart';

class SectionsList extends StatelessWidget {
  const SectionsList({
    Key? key,
    required this.sectionTitle,
    required this.list,
    this.isOriginals = false,
  }) : super(key: key);

  final String sectionTitle;
  final List<Content> list;
  final bool? isOriginals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionsTitle(title: sectionTitle),
          Responsive(
            web: _WebListCards(
              list: list,
            ),
            mobile: _MobileListCards(
              isOriginals: isOriginals,
              list: list,
            ),
          )
        ],
      ),
    );
  }
}

class _MobileListCards extends StatelessWidget {
  const _MobileListCards({
    Key? key,
    required this.isOriginals,
    required this.list,
  }) : super(key: key);

  final bool? isOriginals;
  final List<Content> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isOriginals! ? 400 : 220,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        itemCount: list.length,
        itemExtent: isOriginals! ? 200 : 150,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: DefaultListItem(
              item: list[index],
            ),
          );
        },
      ),
    );
  }
}

class _WebListCards extends StatefulWidget {
  const _WebListCards({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<Content> list;

  @override
  State<_WebListCards> createState() => _WebListCardsState();
}

class _WebListCardsState extends State<_WebListCards> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 1;
  bool _isListHover = false;
  bool _isActionHover = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (_) => _isHoveringList(true),
      onExit: (_) => _isHoveringList(false),
      child: SizedBox(
        height: size.width * .12,
        width: double.infinity,
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .035,
                vertical: 10,
              ),
              itemCount: widget.list.length,
              itemExtent: size.width * .192,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: DefaultListItem(
                    item: widget.list[index],
                    useWebImage: true,
                  ),
                );
              },
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Visibility(
                visible: _isListHover,
                child: MouseRegion(
                  onEnter: (_) => _isHoveringAction(true),
                  onExit: (_) => _isHoveringAction(false),
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      int nextIndex = _currentIndex + 5;
                      if (nextIndex > widget.list.length) {
                        setState(() {
                          _currentIndex = 0;
                        });
                        nextIndex = 0;
                        _scrollController.animateTo(
                          nextIndex.toDouble(),
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                      }
                      setState(() {
                        _currentIndex = nextIndex;
                      });
                      _scrollController.animateTo(
                        (size.width * .165) * nextIndex,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(
                          _isActionHover ? .6 : .3,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Icon(
                          Iconsax.arrow_right_3,
                          color: Colors.white,
                          size: _isActionHover
                              ? size.width * .04
                              : size.width * .02,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _isHoveringList(bool isHover) {
    setState(() {
      _isListHover = isHover;
    });
  }

  _isHoveringAction(bool isHover) {
    setState(() {
      _isActionHover = isHover;
    });
  }
}
