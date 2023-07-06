import '../controllers/search_controller.dart';
import '../view/cartpage.dart';
import '../widgets/search_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../main.dart';
import '../widgets/custom_text.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  TextEditingController searchTextController = TextEditingController();
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: CustomText("Search",textAlign:TextAlign.center , color: Constants.fontBlackColor)),
        elevation: 0.0,
        backgroundColor: Constants.backGroundColor,
        leading: IconButton(onPressed: (){
          Get.back();},

          icon: const Icon(CupertinoIcons.back,color: Constants.fontBlackColor,)/*SvgPicture.asset('assets/svg/back.svg', color: Constants.fontBlackColor,),*/,
          color: Constants.fontBlackColor, ),
        foregroundColor: Constants.fontBlackColor,
        leadingWidth: 5.0,
        actions: [
          IconButton(onPressed: (){
            Get.to(CartPage());
          }, icon: const Icon(Icons.shopping_bag_outlined))
        ],
      ),
      backgroundColor: Constants.backGroundColor,
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                //todo: controller: ,
                controller: searchTextController,
                decoration: InputDecoration(
                  suffix:IconButton ( onPressed: (){
                    //todo:writing filter code
                    }, icon: const Icon(Icons.filter_list)),
                  hintText: "search",
                  helperStyle: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: Constants.fontBlackColor
                  ),
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25),
                  ),
                  prefix: IconButton(onPressed: (){
                    //todo: list of items
                    //todo: writing search code
                    if(searchTextController.text.isNotEmpty){
                          searchController
                              .setSearchText(searchTextController.text);

                        if(searchController.found.value == false){
                      searchController.searchAboutById(searchController.getSearchText());
                        }
                    }

                    },icon: SvgPicture.asset("assets/svg/search.svg",)),
                ),
              ),
              CustomText("Found ${searchController.searchItems.length} Product", fontsize: 15,),
              GetBuilder<SearchController>(
                  init: searchController,
                  builder: (controller){
                    return ListView.builder(

                      itemCount:searchController.searchItems.isNotEmpty? searchController.searchItems.length:0,
                      itemBuilder: (BuildContext context, int index) {
                      if(searchController.searchItems.isNotEmpty)
                        {
                          return SearchItem(
                            id: "${searchController.searchItems[index]["id"]!}",
                            productName: "${searchController.searchItems[index]["productName"]!}",
                            description: "${searchController.searchItems[index]["description"]!}",
                            imgPath: "${searchController.searchItems[index]["imgPath"]!}",
                            price: "${searchController.searchItems[index]["price"]!}",
                            rate: double.parse("${searchController.searchItems[index]["rate"]!}"),
                          );
                        }
                      else{
                        return CustomText(searchController.message.value,
                          fontsize: 22, fontWeight: FontWeight.w900,
                          color: Colors.brown,textAlign: TextAlign.center,);
                      }

                    },
                    );
                  })
            ],
          ),
        ) ,),
    );
  }
}
