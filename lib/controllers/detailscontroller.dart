import 'package:get/get.dart';

class DetailsController extends GetxController{
  RxString imgPath = "".obs;

  void setImagePath(String imgPath){
    this.imgPath = imgPath.obs;
    update();
  }

  String getImagePath(){
    return this.imgPath.value;
  }
}