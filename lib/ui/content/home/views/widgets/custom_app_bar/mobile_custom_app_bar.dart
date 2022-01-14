import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_ui/core/utils/assets.dart';
import 'package:netflix_ui/ui/content/home/views/widgets/custom_app_bar/filter_options.dart';

class MobileCustomAppBar extends StatelessWidget {
  const MobileCustomAppBar({
    Key? key,
  }) : super(key: key);

  final List<Widget> options = const [
    FilterOptions(title: 'Series'),
    FilterOptions(title: 'Movies'),
    FilterOptions(title: 'Categories'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black.withOpacity(.7),
      title: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Row(
          children: [
            Image.asset(
              Assets.netflixLogo0,
              height: 30,
            ),
            const Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Iconsax.search_normal_1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                ClipRRect(
                  child: Image.asset(
                    Assets.thumbnail,
                    height: 30,
                  ),
                  borderRadius: BorderRadius.circular(8),
                )
              ],
            )
          ],
        ),
      ),
      pinned: true,
      floating: true,
      bottom: PreferredSize(
        preferredSize: Size(size.width, 58),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 25.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: options,
          ),
        ),
      ),
    );
  }
}
