import 'package:flutter/material.dart';

class RatioCalculator {
  static final RatioCalculator _singleton = RatioCalculator._internal();

  late Size screenSize;
  late double figmaWidth;
  late double figmaHeight;

  factory RatioCalculator() {
    return _singleton;
  }

  void updateRatio({
  required BuildContext context,
  required double figmaWidth,
  required double figmaHeight,
  }) {
  _singleton.screenSize = MediaQuery.of(context).size;
  _singleton.figmaWidth = figmaWidth;
  _singleton.figmaHeight = figmaHeight;
  }

  RatioCalculator._internal();

  double get aspectRatio => screenSize.width / screenSize.height;

  Size calculateSize(Size originalSize) =>
      Size(originalSize.width * aspectRatio, originalSize.height);

  double calculateWidth(double originalWidth) =>
      (originalWidth * screenSize.width) / figmaWidth;

  double calculateHeight(double originalHeight) =>
      (originalHeight * screenSize.height) / figmaHeight;
}
//esta es la clase que hace la app responsive...