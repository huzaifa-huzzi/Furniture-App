import 'package:dart_furniture_store_app/Resources/Imagecached.dart';
import 'package:dart_furniture_store_app/Resources/colors.dart';
import 'package:dart_furniture_store_app/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';


class CartView extends StatefulWidget {
  final ItemModel item;
  const CartView({super.key, required this.item});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
          title:const  Text('My Cart'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.02 ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.04),
            child: Column(
              children: [
              Expanded(
                child: PersistentShoppingCart().showCartItems(
                    cartTileWidget: ({required data}) => Card(
                      color: AppColors.primaryColor,
                      child: Row(
                        children: [
                          Padding(
                            padding:const  EdgeInsets.symmetric(horizontal: 4,vertical: 0),
                            child: AssetImageWidget(
                                assetImagePath: data.productThumbnail.toString(),
                                     height: 100,
                                   width: 100,
                                 ),
                          ),

                          SizedBox(width: mediaQuery.size.width *0.01,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(data.productName,style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),
                              Text(data.productDescription.toString(),maxLines: 2,style:const  TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
                              SizedBox(height: mediaQuery.size.height *0.01,),
                              Row(
                                children: [
                                  Text("\$ ${data.unitPrice}",maxLines: 2,style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
                                  IconButton(onPressed: (){
                                    PersistentShoppingCart().removeFromCart(data.productId);
                                  }, icon:const  Icon(Icons.delete,color: Colors.red,)),
                                ],
                              )


                            ],
                          ),
                          SizedBox(width: mediaQuery.size.width *0.09,),
                          Column(
                            children: [
                              IconButton(onPressed: (){
                                PersistentShoppingCart().incrementCartItemQuantity(data.productId);
                              }, icon:const  Icon(Icons.add,color: Colors.white)),
                              Text(data.quantity.toString(),style:const  TextStyle(color: Colors.white),),
                              IconButton(onPressed: (){
                                PersistentShoppingCart().decrementCartItemQuantity(data.productId);
                              }, icon:const  Icon(Icons.remove,color: Colors.white)),

                            ],
                          )

                        ],
                      ),
                    ),
                    showEmptyCartMsgWidget:const  Center(child: Text('cart is empty'))),
              ),
                PersistentShoppingCart().showTotalAmountWidget(cartTotalAmountWidgetBuilder: (totalAmount){
                  return  Visibility(
                       visible: totalAmount == 0.0 ? false : true,
                      child: Text(totalAmount.toString()));
                })

              ],
            ),
          ),
        ),
      ),
    );

  }
}
