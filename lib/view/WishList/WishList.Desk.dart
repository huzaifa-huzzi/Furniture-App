import 'package:dart_furniture_store_app/Provider/FavouriteIcon/FavouriteIconProvider.dart';
import 'package:dart_furniture_store_app/Resources/RoundButton.dart';
import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:dart_furniture_store_app/model/item_model.dart';
import 'package:dart_furniture_store_app/utils/Route/Route%20name.dart';
import 'package:dart_furniture_store_app/utils/utils.dart';
import 'package:dart_furniture_store_app/view/NaveBar%20Drawer/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';


class WishListDesk extends StatefulWidget {
  const WishListDesk({super.key});

  @override
  State<WishListDesk> createState() => _WishListDeskState();
}

class _WishListDeskState extends State<WishListDesk> {
  final PersistentShoppingCart cart = PersistentShoppingCart();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      drawer:const NavBar(),
      appBar: AppBar(
        iconTheme:const IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.white,
        actions: [
          cart.showCartItemCountWidget(cartItemCountWidgetBuilder: (itemCount) => IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.cart);
            },
            icon: Badge(
              label: Text(itemCount.toString()),
              backgroundColor: AppColors.primaryColor,
              child:const Icon(Icons.shopping_bag),
            ),
          ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.3),
              child: Text('Desk', style: Theme.of(context).textTheme.titleSmall!.copyWith()),
            ),
            SizedBox(height: mediaQuery.size.height * 0.03),
            CircleAvatar(
              radius: 120,
              backgroundImage:const AssetImage('assets/images/desk.jpg'),
              child: Consumer<FavoriteModel>(builder: (context, favoriteModel, _) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      bottom:20,
                      right: 20,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {
                            favoriteModel.toggleFavorite();
                          },
                          child: Icon(
                            favoriteModel.isFavorite ? Icons.favorite : Icons.favorite_outline_rounded ,
                            size: 40,
                            color: favoriteModel.isFavorite ? Colors.red : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: mediaQuery.size.height * 0.03),
            Text('Desk :80 ', style: Theme.of(context).textTheme.titleMedium!.copyWith()),
            SizedBox(height: mediaQuery.size.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
              child: Text(
                'Lorem Ipsum es simple\nel texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sidoel texto de relleno estándar de las  desde el año 1500.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.05),
            RoundButton(
              title: 'Add To Cart',
              onTap: () {
                ItemModel item = const ItemModel(
                  productId: '3',
                  ProductName: 'Desk',
                  ProductDescription: 'Comfortable Desk \nFor sell',
                  ProductThumbnail: 'assets/images/desk.jpg',
                  unitPrice: 80,
                );

                // Use the same instance of PersistentShoppingCart
                cart.addToCart(
                  PersistentShoppingCartItem(
                    productId: item.productId,
                    productName: item.ProductName,
                    productDescription: item.ProductDescription,
                    productThumbnail: item.ProductThumbnail,
                    unitPrice: item.unitPrice,
                    quantity: 0,
                  ),
                );

                Utils.toastMessage('Item Added to cart');
              },
            ),
            SizedBox(height: mediaQuery.size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
