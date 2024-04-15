import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_furniture_store_app/Resources/Loading_Indicator.dart';
import 'package:flutter/material.dart';


class AssetImageWidget extends StatelessWidget {
  final String assetImagePath;
  final double width, height, borderRadius, iconSize;

  const AssetImageWidget({
    Key? key,
    required this.assetImagePath,
    this.width = 40,
    this.height = 100,
    this.borderRadius = 18,
    this.iconSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        assetImagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Icon(
            Icons.error_outline,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
