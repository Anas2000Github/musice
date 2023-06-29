
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/constants.dart';
import 'package:project_ecommerce/helper/sized_box_enum.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';


class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Constants.backGroundColor,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: Get.width,
                  height: Get.height*.3,
                  child: Image.asset('assets/images/purchase.png')),
              Container(
                  width: Get.width*.5,
                  alignment: Alignment.center,
                  child: CustomText(text:'Hey, Jarif \nThank You For Purchase',textAlign: TextAlign.center,fontsize: 18,height: 1.5,color: Constants.fontColor,),),
              Container(
                  height: Get.height*.3,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           CustomText(text:'Total',fontsize: 15),
                           CustomText(text:'\$100.0',fontsize: 15),
                         ],
                       ),
                       5.height,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText(text:'Shipping',fontsize: 15),
                           CustomText(text:'\$5.0',fontsize: 15),

                         ],
                       ),
                       5.height,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText(text:'Shoe',fontsize: 15),
                           CustomText(text:'\$95.0',fontsize: 15),

                         ],
                       ),
                      20.height,
                      CustomButton.buttonStyle(
                          onPressed: () {}, text: 'Filter', paddingHorizontal: 160,
                          colorButton: Constants.fontColor,
                      borderSize: 50),
                      10.height,
                      TextButton(onPressed: (){}, child: Text('Track Order ',style: TextStyle(color: Colors.blue),)),
                    ],
                  ),),
               60.height,
               CustomButton.buttonStyle(
                   onPressed: () {}, text: 'Continue Shaping', paddingHorizontal: 110,
                   colorButton: Constants.primaryColor,
                   borderSize: 50),

            ],
          ),
        ),
      ),
    );
  }
}