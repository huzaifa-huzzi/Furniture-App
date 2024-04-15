import 'package:dart_furniture_store_app/Resources/RoundButton.dart';
import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:dart_furniture_store_app/view/Login/LoginScreen.dart';
import 'package:dart_furniture_store_app/view/Signup/Signup%20Scrreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double radius = mediaQuery.size.width * 0.03;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            Padding(
            padding: EdgeInsets.only(right: mediaQuery.size.width * 0.70),
        child:const  Image(
          image: AssetImage('assets/images/overlap.png'),
        ),
      ),
      SizedBox(height: mediaQuery.size.height * 0.03),
      Container(
        constraints: BoxConstraints(
          maxHeight: mediaQuery.size.height * 0.3,
          maxWidth: mediaQuery.size.width * 0.8,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child:const  Center(
          child: Image(
            image: AssetImage('assets/images/shop-2.png'),
          ),
        ),
      ),
      SizedBox(height: mediaQuery.size.height * 0.01),
      RoundButton(title: 'Login',loading: loading, onTap: (){
        Get.to(()=>const LoginScreen(),transition: Transition.upToDown,duration:const  Duration(seconds: 2));
      }),
      SizedBox(height: mediaQuery.size.height * 0.01),
      GestureDetector(
        onTap: (){
          Get.to(() =>const  SignUpScreen(),transition: Transition.upToDown,duration:const  Duration(seconds: 2));
        },
        child: Text.rich(
            TextSpan (
              text: 'Create An Account ?',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(),
            )
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            height: mediaQuery.size.height * 0.15,
            child:const  Image(
              image: AssetImage('assets/images/Group 2.png'),
            ),
          ),
        ),
      ),
            ],
          ),
        ),
      ),
    );
  }
}
