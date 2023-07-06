import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../mysampledata.dart';
import '../widgets/search_item.dart';

class SearchController extends GetxController {
  RxList<Map<String,Object>> searchItems= RxList();
  RxString message = "".obs;
  RxString searchText="".obs;
  RxBool found = false.obs;

  void setSearchText(String? text){
    searchText = text!.obs;
    update();
  }

  String getSearchText(){
    return searchText.value;
  }

  void removeItemById(String? id){

    if(itemsList.isNotEmpty){
      for (int i = 0; i < itemsList.length; i++) {
        if (itemsList[i]["id"] == id!) {
          searchItems.remove(itemsList[i]);
          found = true.obs;
        }else{
          found = true.obs;
        }
      }
    }else{
      message = "No item exists".obs;
      found = false.obs;
    }
    update();
  }

  void searchAbout(Map<String,Object>? anItem){
    if(itemsList.isNotEmpty){
      for (int i = 0; i < itemsList.length; i++) {
        if (itemsList[i] == anItem!) {
          searchItems.add(itemsList[i]);
          found = true.obs;
        }else {
          message = "The Item is not found".obs;
          found = false.obs;
        }
      }
    }else{
      message = "Sorry!! No item exists".obs;
      found = false.obs;
    }
    update();
  }
  void searchAboutById(String? id){
    if(itemsList.isNotEmpty){
      for (int i = 0; i < itemsList.length; i++) {
        if (itemsList[i]["id"] == id!) {
          searchItems.add(itemsList[i]);
          message = "The item is added".obs;
          found = true.obs;
        }
        else{
          message="Sorry!! the Item is not found".obs;
          found = false.obs;
        }
      }
    }else{
      message = "Sorry!! No item exists".obs;
      found = false.obs;
    }
    update();
  }
  void searchAboutByProductName(String? name){
    if(itemsList.isNotEmpty){
      for (int i = 0; i < itemsList.length; i++) {
        if (itemsList[i]["productName"]== name!) {
          searchItems.add(itemsList[i]);
          found = true.obs;
        }else{
          message = "Sorry!! the item is not found".obs;
          found = false.obs;
        }
      }
    }else{
      message = "No item exists".obs;
      found = false.obs;
    }
    update();
  }
  void searchAboutByDescription(String? text){
    if(itemsList.isNotEmpty){
      for (int i = 0; i < itemsList.length; i++) {
        //
        if ((itemsList[i]["description"])!.contains(text!)) {
          searchItems.add(itemsList[i]);
        }else{
          message = "Sorry! the item is not found.".obs;
          found = false.obs;
        }
      }
    }else{
      message = "No item exists".obs;
      found = false.obs;
    }
    update();
  }


  void remove(Map<String,Object>? anItem){
    if(itemsList.isNotEmpty){
      for (int i = 0; i < itemsList.length; i++) {
        if (itemsList[i] == anItem!) {
          searchItems.remove(itemsList[i]);
        }else{
          message = "Sorry! the item is exists.".obs;
        }found = false.obs;
      }
    }else{
      message = "Sorry!! No item exists.".obs;
      found = false.obs;
    }
  }

  void itemsListClean(){
    searchItems= RxList();
    message = "".obs;
    searchText="".obs;
    found = false.obs;

    update();
  }
}
