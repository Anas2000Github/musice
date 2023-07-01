// import 'dart:ffi';

import '../controllers/cartcontroller.dart';
import '../widgets/cartitem.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SettingsServices extends GetxService{
  RxInt itemsCount =0.obs;
  RxInt index = 0.obs;
  CartController cartController = Get.put(CartController());

  RxList<CartItemWidget> items = RxList();

// todo : هذا الميثود الذي يُضيف المنتج في سلة المشتريات
  void addItemtoCart(CartItemWidget product){
    bool itemsContainsProduct =false;
    if(items.isEmpty) {
      items.add(product);
      cartController.incrementTotalPrice(double.parse(items.last.price!.substring(1)));
      cartController.update();}
    else{
      for (int i = 0; i < items.length; i++) {
        if (items[i].id == product.id) {
          itemsContainsProduct = true;
        }
      }
      if(itemsContainsProduct == false){
        items.add(product);
        cartController.incrementTotalPrice(
            double.parse(items.last.price!.substring(1)));
        cartController.update();
      }
    }
    if (kDebugMode) {
      print((items.isEmpty));
    }
  }

  void removeItem(CartItemWidget itemData){
    // ااستخدم index للعنصر
    // sharePrefs!.remove("item");
    for(CartItemWidget itemm in items){
      if(itemm == itemData){
        if(items[items.indexOf(itemData)] == items.last) {
          items[items.indexOf(itemData)]=CartItemWidget();
          cartController.update();
        }else
        if(items[items.indexOf(itemData)]==items.first){
          for(int i = 0; i<items.length; i++){
            if(i<items.length-1) {
              items[i] = items[i++];
            }
          }
        }
        break;
      }
      cartController.update();
    }

    int count = cartController.counter.value;
    do{
      cartController.decrementTotalPrice(
          double.parse(itemData.price!.substring(1)));
      count--;
    }while(count>0);
    // cartController.hideItem = true.obs;
    cartController.update();
    // cartController.remove(index)
  }

}