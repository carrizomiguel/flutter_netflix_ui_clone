import 'package:flutter/material.dart';

class Content {
  Content({
    required this.name,
    this.titleImageUrl,
    this.videoUrl,
    this.description,
    this.color,
    this.isTop = false,
    this.top = 0,
    this.webImage,
    this.mobileImage,
  });

  String name;
  String? titleImageUrl;
  String? videoUrl;
  String? description;
  Color? color;
  bool? isTop;
  int? top;
  String? webImage;
  String? mobileImage;
}
