import 'package:flutter/foundation.dart';


class FavoriteModel3 with ChangeNotifier {
 bool   isFavourite = false;

 void toggleFavorite(){
  isFavourite = !isFavourite;
  notifyListeners();

 }


}