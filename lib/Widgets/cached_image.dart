import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLinks extends StatelessWidget {
  final String url;
  final double? height;
  final double width;
  final BoxShape shape;

  ImageLinks(
      {required this.url,
      this.height,
      this.width = double.infinity,
      this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: imageProvider,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape,
        ),
        child: Image.asset(
          'assets/whiteSpace.png',
          fit: BoxFit.cover,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape,
        ),
        child: Image.asset(
          'assets/whiteSpace.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
