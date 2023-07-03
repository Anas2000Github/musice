import '../constants.dart';
import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cartcontroller.dart';
import 'box_of_size.dart';
import 'custom_text.dart';
import 'detailsitem_smallpic.dart';

// ignore: must_be_immutable
class DetailItemWidget extends StatelessWidget {
  final String? id;
  final String? imgPath;
  final String? productName;
  final String? price;
  final List<String>? smallPics;
  RxInt quantity = 1.obs;

  // const List<CartItemWidget> cartItemWidgets ;
  //todo : هذا هو الكلاس اللي فيه العنصر الذي في صفحة تفاصيل المنتج
  DetailItemWidget({
    Key? key,
    this.id,
    this.imgPath,
    this.productName,
    this.price,
    this.smallPics
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text:"$price"),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage(
                  "$imgPath",
                ) ,fit: BoxFit.fill),

              ),
            ),
            //10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(text:"$productName"),
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
                          return CustomText(text:"${quantity.value}");
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
            CustomText(text:"Select color"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallPic(imagePath: smallPics![0],),
                SmallPic(imagePath: smallPics![1],),
                SmallPic(imagePath: smallPics![2],),
                SmallPic(imagePath: smallPics![3],),
              ],
            ),
            CustomText(text:"Select size"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoxOfSize(size: "41",),
                BoxOfSize(size: "42",),
                BoxOfSize(size: "43",),
                BoxOfSize(size: "44",),
              ],
            ),
          ],
        ));
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
// @override
// void initState() {
//   RxInt n = CartItem().cartitems.length.obs;
//   for (int i = 0; i < n.toInt(); i++) {
//     bag.add(CartItemWidget(
//       imgPath: CartItem().cartitems[i].imgPath,
//       productName: CartItem().cartitems[i].productName,
//       price: CartItem().cartitems[i].price,
//       quantity: CartItem().cartitems[i].quantity,
//     ));
//   }
// }
}
