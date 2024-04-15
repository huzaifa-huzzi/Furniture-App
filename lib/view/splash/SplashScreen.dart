import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:dart_furniture_store_app/services/splashServices.dart';
import 'package:flutter/material.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 Services splashScreenTwo = Services();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreenTwo.isLogin(context);
  }

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
                padding: EdgeInsets.only(right: mediaQuery.size.width * 0.52),
                child:const  Image(
                  image: AssetImage('assets/images/overlap.png'),
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.03),
              Container(
                constraints: BoxConstraints(
                  maxHeight: mediaQuery.size.height * 0.4,
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
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: mediaQuery.size.height * 0.2,
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
