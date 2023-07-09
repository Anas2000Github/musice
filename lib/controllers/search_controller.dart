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

  void filterProducts(String searchText){
    List<Map<String, dynamic>> result = [];
    if(searchText.isEmpty){
        result = allProductsList;
    }else{
      result = allProductsList.where((element) =>
        element["productName"]
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase())||
          element["description"]
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase())||
          element["rate"]
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase())||
          element["imgPath"]
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase())
      )
        .toList();
      // for(int k =0;k<allProductsList.length;k++) {
      //   //
      //   if(allProductsList[k]["productName"]
      //       .toString()
      //       .toLowerCase()
      //       .contains(searchText.toLowerCase())||
      //       allProductsList[k]["description"]
      //           .toString()
      //           .toLowerCase()
      //           .contains(searchText.toLowerCase())||
      //       allProductsList[k]["id"]
      //           .toString()
      //           .toLowerCase()
      //           .contains(searchText)||
      //       allProductsList[k]["imgPath"]
      //           .toString()
      //           .toLowerCase()
      //           .contains(searchText)){
      // //     foundProducts.value[k]=allProductsList[k];
      //
      //   }

      // }
      // result = foundProducts.value;
    }
    foundProducts.value = result;
  }
}
