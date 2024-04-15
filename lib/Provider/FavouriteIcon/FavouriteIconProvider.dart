import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  bool isFavorite = false;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
