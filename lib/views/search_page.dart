import '../controllers/detailscontroller.dart';
import '../controllers/search_controller.dart';
import '../views/cartpage.dart';
import '../views/details_view.dart';
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
  DetailsController detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Center(child: CustomText("Search".tr, textAlign: TextAlign.center,
            color: Constants.fontBlackColor)),
        elevation: 0.0,
        backgroundColor: Constants.backGroundColor,

        leading: IconButton(onPressed: () {
          Get.back();
        },

          icon: const Icon(CupertinoIcons.back, color: Constants
              .fontBlackColor,) /*SvgPicture.asset('assets/svg/back.svg', color: Constants.fontBlackColor,),*/,
          color: Constants.fontBlackColor,),
        foregroundColor: Constants.fontBlackColor,
        leadingWidth: 5.0,
        actions: [
          IconButton(onPressed: () {
                  Get.to(() => CartPage());

              }, icon: const Icon(Icons.shopping_bag_outlined))
        ],
      ),
      backgroundColor: Constants.backGroundColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              //todo: controller: ,
              controller: searchTextController,
              onChanged: (value) {
                searchController.searchText.value =value;
                searchController.filterProducts(searchController.searchText.value);
              },
              decoration: InputDecoration(
                labelText: "Search".tr,
                hintText: "Search...".tr,
                suffixIcon: IconButton(onPressed: () {
                  //todo:writing filter code

                }, icon: const Icon(Icons.filter_list)),

                helperStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Constants.fontBlackColor
                ),
                constraints: const BoxConstraints(
                    maxHeight: 65,
                    maxWidth: 500
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Constants.fontBlackColor),
                  borderRadius: BorderRadius.circular(15),
                ),

                prefixIcon: IconButton(
                    onPressed: () {
                      //todo: list of items
                      //todo: writing search code
                      searchController.filterProducts(searchController.getSearchText());
                    }, icon: SvgPicture.asset("assets/svg/search.svg",)),
              ),
            ),
            Expanded(flex: 2,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() =>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          "Found ".tr+"${searchController.foundProducts.value.length}""Product".tr,
                          fontsize: 18, textAlign: TextAlign.left, fontWeight: FontWeight.w900,
                        color: Constants.fontBlackColor,),
                      ),
            ),
                  Expanded(
                    flex: 3,
                    child: Obx(()
                    {

                      if(searchController.foundProducts.value.isNotEmpty){
                        return ListView.builder(
                          itemCount: searchController.foundProducts.value.length,
                          itemBuilder: (BuildContext context, int index) {

                            return showSearchResult(index);
                          },
                        );
                      }else{
                        return const Text("");
                      }
                    }),
                  ),
                ],
              ),),


          ],
        ),
      ),
    );
  }

  Widget showSearchResult(int index) {

      return InkWell(
        onTap: () {
          Get.to(() =>
              DetailsView(id: searchController.foundProducts.value[index]["id"],
                productName:
                searchController.foundProducts.value[index]["productName"],
                description:
                searchController.foundProducts.value[index]["description"],
                imgPath:
                searchController.foundProducts.value[index]["imgPath"],
                price:
                searchController.foundProducts.value[index]["price"],
                rate: double.parse(
                    searchController.foundProducts.value[index]["rate"]
                        .toString()),
                smallPics: [
                  searchController.foundProducts.value[index]["smallPics"][0],
                  searchController.foundProducts.value[index]["smallPics"][1],
                  searchController.foundProducts.value[index]["smallPics"][2],
                  searchController.foundProducts.value[index]["smallPics"][3],
                ],
              ));
          setServ.cartController.currentPrice.value= double.parse(searchController.foundProducts.value[index]["price"]);
          setServ.cartController.incrementTotalPrice(setServ.cartController.currentPrice.value);
        },
        child: SearchItem(
          id: searchController.foundProducts.value[index]["id"],
          productName:
             searchController.foundProducts.value[index]["productName"],
          description:
             searchController.foundProducts.value[index]["description"],
          imgPath:
             searchController.foundProducts.value[index]["imgPath"],
          price:
             searchController.foundProducts.value[index]["price"],
          rate: double.parse(
             searchController.foundProducts.value[index]["rate"].toString()),
        ),
      );

  }
}