import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../mysampledata.dart';
import '../widgets/search_item.dart';

class SearchController extends GetxController {
  Rx<List<Map<String,dynamic>>> foundProducts= Rx<List<Map<String,dynamic>>>([]);
  RxString message = "".obs;
  RxString searchText="".obs;
  RxBool found = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    foundProducts.value = allProductsList;
    update();
  }
  void setSearchText(String? text){
    searchText = text!.obs;
    update();
  }

  String getSearchText(){
    return searchText.value;
  }

  void filterProducts(String productItem){
    List<Map<String, dynamic>> result = [];
    if(productItem.isEmpty){
        result = allProductsList;
    }else{
      result =  allProductsList.where((element) => element["name"]
          .toString()
          .toLowerCase()
          .contains(productItem.toLowerCase()))
          .toList();
    }
    foundProducts.value = result;
  }
}
