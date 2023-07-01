import 'dart:ffi';

import '../controllers/cartcontroller.dart';
import '../widgets/cartitem.dart';
import 'package:get/get.dart';

import '../main.dart';

class SettingsServices extends GetxService{
  RxInt itemsCount =0.obs;
  CartController cartController = Get.put(CartController());

  late List<CartItemWidget> items;

  Future<SettingsServices> init () async {
    items = [];
    return this;
  }

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
        cartController.incrementTotalPrice(double.parse(items.last.price!.substring(1)));
        cartController.update();
      }
    }
    print((items.isEmpty));
  }

  void removeItem(CartItemWidget itemData){
    sharePrefs!.remove("item");
    items.remove(itemData);
    int count = cartController.counter.value;
    do{
      cartController.decrementTotalPrice(double.parse(itemData.price!.substring(1)));
      count--;
    }while(count>0);
    cartController.hideItem = true.obs;
    cartController.update();
    // cartController.remove(index)
  }

  void increase(){

  }
}