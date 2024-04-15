import 'package:flutter/foundation.dart';


class FavoriteModel2 with ChangeNotifier{
   bool isFavorite = false;


   void toggleFavorite(){
     isFavorite = !isFavorite;
     notifyListeners();
   }

}