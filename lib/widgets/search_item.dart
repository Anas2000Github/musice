import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class SearchItem extends StatelessWidget{
  final String? id;
  final String? imgPath;
  final String? productName;
  String? price;
  String? description;
  double? rate;

  // const List<CartItemWidget> cartItemWidgets ;
  //todo : هذا هلو الكلاس اللي فيه العنصر
  SearchItem({
    Key? key,
    this.id,
    this.imgPath,
    this.productName,
    this.price,
    this.description,
    this.rate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      height: Get.size.height * .125,
      width: Get.size.width * .8,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Constants.fontBlackColor,width: 2)
      ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "$imgPath",
          width: 80,
          height: 80,
        ),
        Column(
          children: [
            CustomText("$productName", fontsize: 14,color: Constants.fontColor,),
            CustomText("$description",fontsize: 5,color: Constants.fontBlackColor,),
            CustomText("$price", fontsize: 11,)
          ],
        ),
        SizedBox(
          width: Get.size.width * .8 / 3,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(

                  padding: const EdgeInsets.all(1.0),
                  constraints: BoxConstraints(
                    maxHeight: 50, maxWidth: 70
                  ),
                  decoration: BoxDecoration(

                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(30),

                  ) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/star.ico",height: 10,width: 10,color: Colors.amberAccent,),
                      CustomText("$rate",fontsize: 5, fontWeight: FontWeight.bold,)
                    ],
                  ),
                )
              ]),
        )
      ],
    ));
  }
}