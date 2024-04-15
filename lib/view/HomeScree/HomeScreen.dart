import 'package:dart_furniture_store_app/Provider/FavouriteIcon/FavouriteIcon3.dart';
import 'package:dart_furniture_store_app/Provider/FavouriteIcon/FavouriteIconProvider.dart';
import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/view/NaveBar%20Drawer/NavBar.dart';
import 'package:dart_furniture_store_app/view/WishList/WishList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Provider/FavouriteIcon/FavouriteIconProvider2.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final double radius = screenWidth * 0.05;

    return Scaffold(
      drawer:const  NavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme:const  IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                 Padding(
                     padding: EdgeInsets.only(right: mediaQuery.size.width *0.38),
                     child: Text('Trends',style: Theme.of(context).textTheme.titleSmall!.copyWith(),)),
                 SizedBox(height: mediaQuery.size.height * 0.01,),
                 Padding(
                     padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width *0.08),
                     child: Text('Our Amazing furniture',style: Theme.of(context).textTheme.bodySmall!.copyWith(),)),
            SizedBox(height: mediaQuery.size.height * 0.07,),
                  InkWell(
                    onTap:(){
                       Get.to(() =>const  WishListScreen(),transition: Transition.leftToRight,duration:const  Duration(seconds: 1));
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
                        child: Container(
                          height: mediaQuery.size.height * 0.3,
                          width: mediaQuery.size.width * 0.99,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(radius),
                            image:const DecorationImage(
                              image: AssetImage('assets/images/sofa.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child:Consumer<FavoriteModel>(
                            builder: (context, favoriteModel, _) {
                                    return  Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Positioned(
                                          bottom:20,
                                          right: 20,
                                          child: Container(
                                            width: 45,
                                            height: 45,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child:  InkWell(
                                              onTap: (){
                                                favoriteModel.toggleFavorite();
                                              },
                                              child: Icon(
                                                favoriteModel.isFavorite ? Icons.favorite : Icons.favorite_outline_rounded ,
                                                size: 30,
                                                color: favoriteModel.isFavorite ? Colors.red :null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    );

                                                                    }),
                                                                    ),

                                                 ),
                  ),
            SizedBox(height: mediaQuery.size.height * 0.01,),
            Text('Sofa',style: Theme.of(context).textTheme.bodyMedium!.copyWith(),),
            SizedBox(height: mediaQuery.size.height * 0.07,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
              child: Container(
                height: mediaQuery.size.height * 0.3,
                width: mediaQuery.size.width * 0.99,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  image:const DecorationImage(
                    image: AssetImage('assets/images/chair.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child:Consumer<FavoriteModel2>(
                    builder: (context, favoriteModel, _) {
                      return  Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Positioned(
                              bottom:20,
                              right: 20,
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child:  InkWell(
                                  onTap: (){
                                    favoriteModel.toggleFavorite();
                                  },
                                  child: Icon(
                                    favoriteModel.isFavorite ? Icons.favorite : Icons.favorite_outline_rounded ,
                                    size: 30,
                                    color: favoriteModel.isFavorite ? Colors.red :null,
                                  ),
                                ),
                              ),
                            ),
                          ]
                      );
        
                    }),
              ),
        
            ),
            SizedBox(height: mediaQuery.size.height * 0.01,),
            Text('Chair',style: Theme.of(context).textTheme.bodyMedium!.copyWith(),),
            SizedBox(height: mediaQuery.size.height * 0.07,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
              child: Container(
                height: mediaQuery.size.height * 0.3,
                width: mediaQuery.size.width * 0.99,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  image:const DecorationImage(
                    image: AssetImage('assets/images/desk.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child:Consumer<FavoriteModel3>(
                    builder: (context, favoriteModel, _) {
                      return  Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Positioned(
                              bottom:20,
                              right: 20,
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child:  InkWell(
                                  onTap: (){
                                    favoriteModel.toggleFavorite();
                                  },
                                  child: Icon(
                                    favoriteModel.isFavourite ? Icons.favorite : Icons.favorite_outline_rounded ,
                                    size: 30,
                                    color: favoriteModel.isFavourite ? Colors.red :null,
                                  ),
                                ),
                              ),
                            ),
                          ]
                      );

                    }),
              ),

            ),
            SizedBox(height: mediaQuery.size.height * 0.01,),
            Text('Desk',style: Theme.of(context).textTheme.bodyMedium!.copyWith(),),
            SizedBox(height: mediaQuery.size.height * 0.04,),
             Padding(
               padding: EdgeInsets.only(bottom: mediaQuery.size.height*0.04,left: mediaQuery.size.width *0.04 ),
                 child: Text('Lorem Ipsum es sidoel texto \nde relleno de las imprentas \ny archivos de texto.',style: Theme.of(context).textTheme.bodySmall!.copyWith(),)),
                                           ]
                                             ),
      ),
                         );

  }
}


