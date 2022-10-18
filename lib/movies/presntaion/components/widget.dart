import 'package:flutter/material.dart';

Image image(String imageUrl, double width, double hight) {
  return Image.asset(
    imageUrl,
    width: width,
    height: hight,
    fit: BoxFit.fitWidth,
  );
}
