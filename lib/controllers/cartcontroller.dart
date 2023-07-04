import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cartitem.dart';

class CartController extends GetxController {
  RxInt counter = 0.obs;
  RxBool hideItem = false.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble shipping = 0.0.obs;
  RxDouble currentPrice = 0.0.obs;
  RxList<CartItemWidget> items = RxList();


  late RxMap<String, Function()> process;


  void incrementTotalPrice(double value){
    totalPrice= (totalPrice.toDouble() + value).obs;
    update();
  }
  void decrementTotalPrice(double value){
    totalPrice= (totalPrice.toDouble() - value).obs;
    update();
  }
}
