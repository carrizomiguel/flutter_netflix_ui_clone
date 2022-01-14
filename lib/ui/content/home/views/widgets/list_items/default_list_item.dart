import 'package:flutter/material.dart';
import 'package:netflix_ui/ui/content/home/models/content_model.dart';
import 'package:netflix_ui/ui/widgets/responsive/responsive.dart';

class DefaultListItem extends StatelessWidget {
  const DefaultListItem({
    Key? key,
    required this.item,
    this.useWebImage = false
  }) : super(key: key);

  final Content item;
  final bool? useWebImage;

  @override
  Widget build(BuildContext context) {
    final isWeb = Responsive.isWeb();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            useWebImage! ? item.webImage! : item.mobileImage!,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius:
            isWeb ? BorderRadius.circular(5) : BorderRadius.circular(10),
      ),
    );
  }
}
