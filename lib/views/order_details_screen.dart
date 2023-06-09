import 'package:flutter/material.dart';
// import 'package:flutter_svg/src/picture_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/constants.dart';
import 'package:project_ecommerce/helper/sized_box_enum.dart';
import 'package:project_ecommerce/main.dart';
import 'package:project_ecommerce/views/temp1.dart';

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
        leading: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/svg/back.svg')),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,

        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: SizedBox(
                    width: Get.width,
                    height: Get.height*.3,
                    child: Image.asset('assets/images/purchase.png')),
              ),
               FittedBox(
                 child: Container(
                    width: Get.width*.5,
                    alignment: Alignment.center,
                    child: CustomText('Hey, Jarif \nThank You For Purchase',textAlign: TextAlign.center,fontsize: 18,height: 1.5,color: Constants.fontColor,),),
               ),
              Container(
                  height: Get.height*.3,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           CustomText('Total',fontsize: 15),
                           CustomText('\$${setServ.cartController.totalPrice}',fontsize: 15),
                         ],
                       ),
                       5.height,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText('Shipping',fontsize: 15),
                           CustomText('\$${setServ.cartController.shipping}',fontsize: 15),

                         ],
                       ),
                       5.height,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText('Shoe',fontsize: 15),
                           CustomText('\$${setServ.cartController.currentPrice}',fontsize: 15),

                         ],
                       ),
                      20.height,
                      CustomButton.buttonStyle(
                            onPressed: () {
                            Get.to(Temp1());
                            }, text: 'Filter', paddingHorizontal: Get.width*.3,
                          colorButton: Constants.fontColor,
                      borderSize: 50),
                      10.height,
                      TextButton(onPressed: (){}, child: const Text('Track Order ',style: TextStyle(color: Colors.blue),)),
                    ],
                  ),),
               (Get.height*.025).height,
               CustomButton.buttonStyle(
                   onPressed: () {}, text: 'Continue Shipping', paddingHorizontal: Get.width*.2,
                   colorButton: Constants.primaryColor,
                   borderSize: 50),

            ],
          ),
        ),
      ),
    );
  }
}
