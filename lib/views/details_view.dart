import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controllers/cartcontroller.dart';
import '../widgets/box_of_size.dart';
import '../widgets/custom_text.dart';
// import '../widgets/detailsitem.dart';
import '../widgets/detailsitem_smallpic.dart';
import '../controllers/detailscontroller.dart';
// import 'package:flutter_svg/svg.dart';

class DetailsView extends StatelessWidget {
  final String? id;
  final String? imgPath;
  final String? productName;
  String? price;
  String? description;
  double? rate;
  List<String>? smallPics;
  RxInt quantity = 1.obs;
  DetailsView({
    Key? key,
    this.id,
    this.imgPath,
    this.productName,
    this.price,
    this.description,
    this.rate,
    this.smallPics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title:  Center(child: CustomText("Details view".tr,textAlign:TextAlign.center , color: Constants.fontBlackColor)),
        elevation: 0.0,
        backgroundColor: Constants.backGroundColor,
        leading: IconButton(onPressed: (){
          setServ.cartController.currentPrice.value= double.parse(price!.substring(1));

          setServ.cartController.totalPrice = 0.0.obs;
          Get.back();},
          icon: const Icon(CupertinoIcons.back,color: Constants
              .fontBlackColor,)/*SvgPicture.asset('assets/svg/back.svg', color: Constants.fontBlackColor,),*/,
          color: Constants.fontBlackColor, ),
        foregroundColor: Constants.fontBlackColor,
      ),
      backgroundColor: Constants.backGroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.symmetric(vertical: 5) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText("$price"),

              GetBuilder(
                init: DetailsController(),
                builder: (detailsController) {
                  if(detailsController.getImagePath() != "") {
                    return Image.asset(detailsController.getImagePath(),width: Get.size.width,height: 250,);
                  }
                  return Image.asset(imgPath!,width: Get.size.width,height: 250,);
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText("$productName", fontWeight: FontWeight.bold,),
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
              CustomText("Select color", textAlign: TextAlign.left,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallPic(imagePath: smallPics![0],),
                  SmallPic(imagePath: smallPics![1],),
                  SmallPic(imagePath: smallPics![2],),
                  SmallPic(imagePath: smallPics![3],),
                ],
              ),
              CustomText("Select size", textAlign: TextAlign.left,),
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
                        return CustomText("${controller.currentPrice}");
                      }
                  )
                ],
              ),
              //زر إنهاء الشراء
              TextButton(
                  onPressed: () {
                    //todo: إنهاء عملية الشراء
                    //todo:  ربط فايربيس
                    //todo: الإنتقال إلى صفحة الدفع
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
          ),
        ),
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
