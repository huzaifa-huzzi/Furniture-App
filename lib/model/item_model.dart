import 'package:flutter/material.dart';

class ItemModel{
  final String productId, ProductName,ProductDescription,ProductThumbnail;
  final double unitPrice;

  const ItemModel({
     required this.ProductDescription,
     required this.ProductName,
    required this.productId,
    required this.ProductThumbnail,
    required this.unitPrice,
});

}