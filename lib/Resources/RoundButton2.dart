import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';



class RoundButton2 extends StatelessWidget {
 final  String title;
 final VoidCallback onPress;
  bool loading ;
   RoundButton2({super.key,required this.title ,required this.onPress ,this.loading =false});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double radius = mediaQuery.size.width * 0.1;
    return InkWell(
      onTap: onPress,
      child: Container(
        height: mediaQuery.size.height * 0.07,
        width: mediaQuery.size.width * 0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color:AppColors.greyColor,
            width: 3,
          )
        ),
        child: Center(
          child:loading ?const  LoadingIndicator(indicatorType: Indicator.ballClipRotate,colors: [AppColors.greyColor],) : Text(title,style:Theme.of(context).textTheme.bodySmall!.copyWith() ,),
        ),
      ),
    );
  }
}
