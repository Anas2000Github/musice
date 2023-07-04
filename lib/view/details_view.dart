import '../main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controllers/cartcontroller.dart';
import '../widgets/custom_text.dart';
import '../widgets/detailsitem.dart';
// import 'package:flutter_svg/svg.dart';

class DetailsView extends StatelessWidget {
  final String? id;
  final String? imgPath;
  final String? productName;
  final String? price;
  final List<String>? smallPics;
  RxInt quantity = 1.obs;
  DetailsView({
    Key? key,
    this.id,
    this.imgPath,
    this.productName,
    this.price,
    this.smallPics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  CustomText("Details view"),
        elevation: 0.0,
        backgroundColor: Constants.backGroundColor,
        // leading: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/svg/back.svg')),
      ),
      backgroundColor: Constants.backGroundColor,
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //عرض تفاصيل المنتج
              DetailItemWidget(
                imgPath: imgPath!,
                id: id!,
                  price: price!,
                productName: productName!,
                //smallPics: [],
              ),
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
                        return CustomText("${controller.unitPrice}");
                      }
                  )
                ],
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
