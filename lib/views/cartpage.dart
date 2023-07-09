import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../controllers/cartcontroller.dart';
import '../main.dart';
import '../services/settingssettings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

//هذا الملف المُخَصَّصِ لعرضِ صفحة سلة وعربة الأغراض المُختارة لِشِرائها قبل شِرائها
class CartPage extends GetView<SettingsServices> {
  CartPage({Key? key}) : super(key: key);
  RxBool updated=false.obs;
  //ثوابت يجب تغييرها

  @override
  Widget build(BuildContext context) {
    // CartItemWidget ciw = CartItemWidget();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Center(child: CustomText("Cart Page",textAlign:TextAlign.center , color: Constants.fontBlackColor)),
        elevation: 0.0,
        backgroundColor: Constants.backGroundColor,
        leading: IconButton(onPressed: (){
          Get.back();},
          icon: const Icon(CupertinoIcons.back,color: Constants
              .fontBlackColor,)/*SvgPicture.asset('assets/svg/back.svg', color: Constants.fontBlackColor,),*/,
          color: Constants.fontBlackColor, ),
        foregroundColor: Constants.fontBlackColor,
      ),
      // color: Color(rgb(232, 240, 253)),
      //بإمكانك تغيير لون الخلفية من هون /\
      backgroundColor: Constants.backGroundColor,

      body: SingleChildScrollView(
        child: Center(
          child:

          Column(
            children: [
              if(setServ.cartController.items.isNotEmpty)
                GetBuilder<CartController>(

                    builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:
                        //هنا يتم عرض الأغراض المضافة
                        setServ.cartController.items.map((e){
                          return e;
                        }).toList(),

                        //} نهاية عرض الأغراض
                      );
                    }
                ),
              //مسافة 50
              const SizedBox(
                height: 50,
              ),
              //النواتج
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    //Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          "Total",
                        ),
                        GetBuilder<CartController>(
                            builder: (controller) {
                              return CustomText("${controller.totalPrice}");
                            }
                        )
                      ],
                    ),
                    //Shipping
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          "Shipping",
                        ),
                        GetBuilder<CartController>(

                            builder: (controller) {
                              return CustomText("${controller.shipping}");
                            }
                        )
                      ],
                    ),
                    //Shoe's price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          "Shoes",
                        ),
                        GetBuilder(
                            init: CartController(),
                            builder: (controller) {
                              return CustomText("${controller.currentPrice}");
                            }
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //مسافة 50
              const SizedBox(
                height: 50,
              ),
              //زر إتمام عملية الشراء
              //Proceed to checkout
              TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 500,
                    height: 60,
                    constraints: const BoxConstraints(
                        maxHeight: 100,
                        maxWidth: 600,
                        minHeight: 5,
                        minWidth: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue[900],
                    ),
                    child: const Center(
                        child: Text(
                          /*------->*/ "Proceed to Checkout", //<------
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ))
              //نهاية الزر
            ],
          ),
        ),
      ),
    );
  }
}
