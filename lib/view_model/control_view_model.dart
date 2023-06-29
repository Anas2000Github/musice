
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/card_screen.dart';
import '../view/home_screen.dart';
import '../view/order_details_screen.dart';
import '../view/wishlist_screen.dart';

class ControlViewModel extends GetxController{

  var _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget? _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;

  void changSelectedValue(var selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue) {
      case 0 :
          _currentScreen= HomeScreen();
        break;
      case 1 :
       _currentScreen = CardScreen();
        break;

      case 2 :
        _currentScreen = WishListScreen();
        break;
        case 3 :
        _currentScreen = OrderDetailsScreen();
        break;
    }
    update();
  }
}