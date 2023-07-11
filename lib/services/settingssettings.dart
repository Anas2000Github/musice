// import 'dart:ffi';

import '../controllers/cartcontroller.dart';
import '../widgets/cartitem.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SettingsServices extends GetxService{
  RxInt itemsCount =0.obs;
  RxInt index = 0.obs;
  CartController cartController = Get.put(CartController());


// todo : هذا الميثود الذي يُضيف المنتج في سلة المشتريات
  void addItemtoCart(CartItemWidget product){
    bool itemsContainsProduct =false;
    if(cartController.items.isEmpty) {
      cartController.items.add(product);
      cartController.incrementTotalPrice(double.parse(cartController.items.last.price!.substring(1)));
      cartController.update();}
    else{
      for (int i = 0; i < cartController.items.length; i++) {
        if (cartController.items[i].id == product.id) {
          itemsContainsProduct = true;
        }
      }
      if(itemsContainsProduct == false){
        cartController.items.add(product);
        cartController.incrementTotalPrice(
            double.parse(cartController.items.last.price!.substring(1)));
        cartController.update();
      }
    }
    if (kDebugMode) {
      print((cartController.items.isEmpty));
    }
  }

  void removeItem(CartItemWidget itemData){
    int count = itemData.quantity.value;
    while(count>0){

      cartController.decrementTotalPrice(
          double.parse(itemData.price!));
      count--;

    }
    // cartController.hideItem = true.obs;

    try {
      cartController.items.removeAt(cartController.items.indexOf(itemData));
    }catch(e){
      print("$e\n${cartController.items.indexOf(itemData)}");

    }
    cartController.update();

    // cartController.remove(index)
  }

}