import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:dart_furniture_store_app/services/sessionManager.dart';
import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/view/HomeScree/HomeScreen.dart';
import 'package:dart_furniture_store_app/view/Profile/Profile.dart';
import 'package:dart_furniture_store_app/view/WishList/WishList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../../Provider/ProfileProvider.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final ref = FirebaseDatabase.instance.ref().child('user');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Drawer(
      child:  StreamBuilder(stream: ref.child(SessionManager().userId.toString()).onValue, builder: (context,AsyncSnapshot snapshot){
         if(snapshot.hasData){
          Map<dynamic,dynamic> map = snapshot.data.snapshot.value;

          return Consumer<ProfileProvider>(builder: (context,imagePicker,_){
            return
              ListView(
                padding: EdgeInsets.zero,
                children: [
                     UserAccountsDrawerHeader(accountName:Text(map['username'],style:Theme.of(context).textTheme.titleLarge!.copyWith() ,) ,
                      accountEmail: Text(map['email'],style: Theme.of(context).textTheme.bodyMedium!.copyWith(),),
                      currentAccountPicture: CircleAvatar(
                        child: InkWell(
                          onTap: () {

                          },
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RouteName.profile);
                            },
                            child: ClipOval(
                              child: Image(image: const AssetImage('assets/images/shop.png'),
                                width: mediaQuery.size.width * 0.99,
                                height: mediaQuery.size.height * 0.99,
                                fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                    ),

                  ListTile(
                    leading:const  Icon(Icons.home,size: 40,color: AppColors.primaryColor,),
                    title:  Text('Home',style: Theme.of(context).textTheme.titleMedium!.copyWith(),),
                    onTap: () => Get.to(() =>const  HomeScreen(),transition: Transition.leftToRight,duration:const  Duration(seconds: 2)),
                  ),
                  ListTile(
                    leading:const  Icon(Icons.favorite,size: 35,color: AppColors.primaryColor,),
                    title:  Text('Wish List',style: Theme.of(context).textTheme.titleMedium!.copyWith(),),
                    onTap: () => Get.to(() =>const WishListScreen(),transition:Transition.leftToRight,duration:const  Duration(seconds: 2)),
                  ),
                  ListTile(
                    leading:const  Icon(Icons.person,size: 40,color: AppColors.primaryColor,),
                    title:  Text('Profile',style: Theme.of(context).textTheme.titleMedium!.copyWith(),),
                    onTap: () => Get.to(() =>const Profile(),transition: Transition.leftToRight,duration:const  Duration(seconds: 2)),
                  ),

                ],
              );

          });
        }     else {
          debugPrint('Data is null');
          return const Text('Data is null');
        }

      }
      ),

    );
  }
}
