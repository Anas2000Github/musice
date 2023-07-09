import 'package:get/get.dart';

import '../main.dart';

class DetailsController extends GetxController{
  RxString imgPath = "".obs;
  RxDouble currentPrice = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setServ.cartController.currentPrice.value= currentPrice.value;
  }

  void setCurrentPrice(double productPrice){
    currentPrice.value =productPrice;
  }

  void setImagePath(String imgPath){
    this.imgPath = imgPath.obs;
    update();
  }

  String getImagePath(){
    return imgPath.value;
  }
}