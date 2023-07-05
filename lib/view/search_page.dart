import '../view/cartpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../main.dart';
import '../widgets/custom_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: CustomText("Search",textAlign:TextAlign.center , color: Constants.fontBlackColor)),
        elevation: 0.0,
        backgroundColor: Constants.backGroundColor,
        leading: IconButton(onPressed: (){
          setServ.cartController.totalPrice = 0.0.obs;
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
          padding: EdgeInsets.symmetric(horizontal: 2.0,vertical: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                //todo: controller: ,
                decoration: InputDecoration(
                  suffix:IconButton ( onPressed: (){}, icon: Icon(Icons.filter_list)),
                  hintText: "search",
                  helperStyle: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: Constants.fontBlackColor
                  ),
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25),
                  ),
                  prefix: IconButton(onPressed: (){},icon: SvgPicture.asset("assets/svg/search.svg",)),
                ),
              ),
              CustomText("Found 15 Product", fontsize: 15,),
              ListView(
                children: [

                ],
              )
            ],
          ),
        ) ,),
    );
  }
}
