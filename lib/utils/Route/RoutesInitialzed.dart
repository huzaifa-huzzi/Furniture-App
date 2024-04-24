import 'package:dart_furniture_store_app/model/item_model.dart';
import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/view/ForgotPassword/FogotPassword.dart';
import 'package:dart_furniture_store_app/view/HomeScree/HomeScreen.dart';
import 'package:dart_furniture_store_app/view/Login/LoginScreen.dart';
import 'package:dart_furniture_store_app/view/NaveBar%20Drawer/NavBar.dart';
import 'package:dart_furniture_store_app/view/Profile/Profile.dart';
import 'package:dart_furniture_store_app/view/Signup/Signup%20Scrreen.dart';
import 'package:dart_furniture_store_app/view/WishList/WishList.Desk.dart';
import 'package:dart_furniture_store_app/view/WishList/WishList.chair.dart';
import 'package:dart_furniture_store_app/view/WishList/WishList.dart';
import 'package:dart_furniture_store_app/view/cartView/CartView.dart';
import 'package:dart_furniture_store_app/view/splash/SplashScreen.dart';
import 'package:dart_furniture_store_app/view/splash/splashScreen2.dart';
import 'package:flutter/material.dart';

class Routes {


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.splashScreen2:
        return MaterialPageRoute(builder: (_) => const SplashScreen2());

      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.forgot:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());

      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteName.navBar:
        return MaterialPageRoute(builder: (_) => const NavBar());

      case RouteName.profile:
        return MaterialPageRoute(builder: (_) =>const  Profile());

      case RouteName.wishlist:
        return MaterialPageRoute(builder: (_) => const WishListScreen());

      case RouteName.wishlist2:
        return MaterialPageRoute(builder: (_) => const WishListChair());

      case RouteName.wishlist3:
        return MaterialPageRoute(builder: (_) => const WishListDesk());

      case RouteName.cart:
         ItemModel item = const  ItemModel(
          productId: '1',
          ProductName: 'Sofa',
          ProductDescription: 'Comfortable Sofa For sell',
          ProductThumbnail: 'assets/images/sofa.jpg',
          unitPrice: 40000,
        );
        return MaterialPageRoute(builder: (_) =>  CartView(item: item));



      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }




}