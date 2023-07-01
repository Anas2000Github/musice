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

<<<<<<< HEAD
=======

  void productZero(){
    sharePrefs!.setString("productNumber", "0");
    update();
  }

>>>>>>> af70397f3b54c9a73c83fafdc8cc9d1ba3c3cb6c
  void increment() {
    counter++;
    update();
  }

  void decrement() {
    if(counter.value<=0){
      Get.snackbar("Buying shoes", "Can not be less than zero ",
        icon: const Icon(Icons.alarm),
        barBlur:20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
      );
    }else{
      counter--;
    }

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
