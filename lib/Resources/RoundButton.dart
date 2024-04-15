import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


class RoundButton extends StatelessWidget {
 final  String title;
  final VoidCallback onTap;
 final   bool loading ;
  const  RoundButton({super.key,required this.title,required this.onTap,this.loading =false});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double radius = mediaQuery.size.width * 0.1;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: mediaQuery.size.height * 0.07,
        width: mediaQuery.size.width * 0.80,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child:loading ?const  LoadingIndicator(indicatorType: Indicator.ballClipRotate,colors: [Colors.white],) : Text(title,style: Theme.of(context).textTheme.displayMedium!.copyWith(),),
        ),
      ),
    );
  }
}
