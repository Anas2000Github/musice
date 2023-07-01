import 'package:project_ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/cartitemsmodel.dart';

class CartController extends GetxController {
  RxInt counter = 0.obs;
  RxBool hideItem = false.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble shipping = 0.0.obs;
  RxDouble unitPrice = 0.0.obs;
  RxString currentId = "0".obs;
  CartItems item = CartItems();

  late RxMap<String, Function()> process;


  void productZero(){
    sharePrefs!.setString("productNumber", "0");
    update();
  }

  void increment() {
    counter++;
    update();
  }

  void decrement() {
    if(counter.value<=0){
      Get.snackbar("Buying shoes", "Can not be less than zero ",
      icon: Icon(Icons.alarm),
    barBlur:20,
    isDismissible: true,
    duration: Duration(seconds: 3),
    );
    }else{
    counter--;
    }

    update();
  }

  void removeAt(int i) {
    item.cartitems.removeAt(i);
    update();
  }

  void remove(int index) {
    hideItem = false.obs;
    setServ.items.removeAt(index);
    for(int i=0; i<counter.toInt();i++)
    decrementTotalPrice(unitPrice.value);
    update();
  }
  void incrementTotalPrice(double value){
    totalPrice= (totalPrice.toDouble() + value).obs;
    update();
  }
  void decrementTotalPrice(double value){
    totalPrice= (totalPrice.toDouble() - value).obs;
    update();
  }
}
