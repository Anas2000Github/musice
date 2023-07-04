import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controllers/cartcontroller.dart';
import '../widgets/box_of_size.dart';
import '../widgets/custom_text.dart';
// import '../widgets/detailsitem.dart';
import '../widgets/detailsitem_smallpic.dart';
// import 'package:flutter_svg/svg.dart';

class DetailsView extends StatelessWidget {
  final String? id;
  final String? imgPath;
  final String? productName;
  final String? price;
  List<String>? smallPics;
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
    smallPics = [imgPath!,imgPath!,imgPath!,imgPath!,];
    return Scaffold(
      appBar: AppBar(
        title:  CustomText("Details view",textAlign:TextAlign.center , color: Constants.fontBlackColor),
        elevation: 0.0,
        backgroundColor: Constants.backGroundColor,
        // leading: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/svg/back.svg')),
        foregroundColor: Constants.fontBlackColor,
      ),
      backgroundColor: Constants.backGroundColor,
      body: ListView(
        children: [
          CustomText("$price"),
          Image.asset(imgPath!,width: Get.size.width,height: 250,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText("$productName"),
              // Text(prcStr),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        increment();
                      },
                      icon: const Icon(CupertinoIcons.plus_circle)),
                  GetBuilder<CartController>(
                      init: Get.put(CartController()),
                      builder: (cartController) {
                        return CustomText("${quantity.value}");
                      }),
                  IconButton(
                      onPressed: () {
                        decrement();
                      },
                      icon: const Icon(CupertinoIcons.minus_circle))
                ],
              ),

            ],
          ),
          CustomText("Select color", textAlign: TextAlign.start,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallPic(imagePath: smallPics![0],),
              SmallPic(imagePath: smallPics![1],),
              SmallPic(imagePath: smallPics![2],),
              SmallPic(imagePath: smallPics![3],),
            ],
          ),
          CustomText("Select size", textAlign: TextAlign.start,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoxOfSize(size: "41",),
              BoxOfSize(size: "42",),
              BoxOfSize(size: "43",),
              BoxOfSize(size: "44",),
            ],
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
          //زر إنهاء الشراء
          TextButton(
              onPressed: () {
                //todo: إنهاء عملية الشراء

              },
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
                child: Center(
                    child: Image.asset("$imgPath",height: 50,width: 50,)),
              )),
        ],
      ) ,
    );
  }
  void increment() {
    quantity++;
    setServ.cartController.update();
    setServ.cartController
        .incrementTotalPrice(double.parse(price!.substring(1)));
    Get.put(CartController()).update();
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity--;
      setServ.cartController.totalPrice =
          (setServ.cartController.totalPrice.value -
              double.parse(price!.substring(1)))
              .obs;
      setServ.cartController.update();
    }
  }
}
