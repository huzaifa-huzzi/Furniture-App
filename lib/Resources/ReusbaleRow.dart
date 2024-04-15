import 'package:flutter/material.dart';



class ReusableRow extends StatelessWidget {
  String title;
  String value;
  ReusableRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.03),
      child: Column(
              children: [
                ListTile(
                  title: Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(),),
                  trailing: Text(value,style: Theme.of(context).textTheme.displaySmall!.copyWith(),),
                ),

              ],
            )

      );

  }
}