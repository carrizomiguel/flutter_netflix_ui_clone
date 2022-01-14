import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_ui/core/utils/assets.dart';
import 'package:netflix_ui/ui/content/home/views/widgets/custom_app_bar/filter_options.dart';
import 'package:netflix_ui/ui/widgets/responsive/responsive.dart';

class WebCustomAppBar extends StatelessWidget {
  const WebCustomAppBar({
    Key? key,
    required this.scrollOffset,
  }) : super(key: key);

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    final List<Widget> options = Responsive.isMobile(context)
      ? const [
        FilterOptions(title: 'Explore'),
      ]
      : const [
        FilterOptions(title: 'Home'),
        FilterOptions(title: 'Series'),
        FilterOptions(title: 'Movies'),
        FilterOptions(title: 'Latest'),
        FilterOptions(title: 'My List'),
      ];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      color: Colors.black.withOpacity(
        (scrollOffset / 350).clamp(0, 1).toDouble()
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              Assets.netflixLogo1,
              // height: 100,
            ),
            const SizedBox(width: 15,),
            for (var element in options) ...[
              const SizedBox(width: 20,),
              element,
            ],
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Iconsax.search_normal_1,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Iconsax.notification,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            ClipRRect(
              child: Image.asset(
                Assets.thumbnail,
                // height: 40,
              ),
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
      ),
    );
  }
}
