import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/view/HomeScree/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Services {


  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    Future.delayed(Duration.zero, () {
      if(user != null){
        Get.to(() =>const  HomeScreen(),transition: Transition.fade,duration:const  Duration(seconds: 3));
      }else{
        Navigator.pushNamed(context, RouteName.splashScreen2);
      }
    });
  }





}

