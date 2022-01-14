import 'package:flutter/material.dart';
import 'package:netflix_ui/core/utils/assets.dart';
import 'package:netflix_ui/ui/content/home/models/content_model.dart';
import 'package:netflix_ui/ui/content/home/views/widgets/list_items/default_list_item.dart';
import 'package:netflix_ui/ui/content/home/views/widgets/sections/sections_title.dart';
import 'package:netflix_ui/ui/widgets/responsive/responsive.dart';

class TopList extends StatelessWidget {
  const TopList({
    Key? key,
    required this.topList,
  }) : super(key: key);

  final List<Content> topList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionsTitle(
            title: '10 Top Rated in Peru today',
          ),
          SizedBox(
            height: Responsive.isWeb() ? size.width * .2 : 240,
            width: double.infinity,
            child: Responsive(
              mobile: _MobileTopList(
                topList: topList,
              ),
              web: _WebTopList(
                topList: topList,
                size: size,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MobileTopList extends StatelessWidget {
  const _MobileTopList({
    Key? key,
    required this.topList,
  }) : super(key: key);

  final List<Content> topList;

  EdgeInsets _assignMarginByPosition(int position) {
    switch (position) {
      default:
        return EdgeInsets.only(
          left: (178 * (position - 1)).toDouble(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: Stack(
        children: [
          ...topList.reversed.map((e) {
            return Container(
              margin: _assignMarginByPosition(e.top!),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 7,
                    ),
                    width: 150,
                    child: DefaultListItem(
                      item: e,
                    ),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            offset: Offset(12, 0))
                      ],
                    ),
                  ),
                  Positioned(
                    left: -50,
                    bottom: -15,
                    child: Image.asset(
                      Assets.positionTop(
                        e.top!,
                      ),
                      height: 120,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class _WebTopList extends StatelessWidget {
  const _WebTopList({
    Key? key,
    required this.topList,
    required this.size,
  }) : super(key: key);

  final List<Content> topList;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * .03,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: size.width * .22,
        itemCount: topList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: (topList.length - 1) == index
                    ? size.width * .05
                    : size.width * .025,
              ),
              Align(
                widthFactor: index == 0 ? .25 : .4,
                child: Image.asset(
                  Assets.positionTop(
                    topList[index].top!,
                  ),
                  height: (topList.length - 1) == index
                      ? size.width * .15
                      : size.width * .2,
                ),
              ),
              SizedBox(
                width: size.width * .1,
                height: size.width * .14,
                child: DefaultListItem(
                  item: topList[index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
