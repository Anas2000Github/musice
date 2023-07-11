import '../constants.dart';
import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cartcontroller.dart';
import '../mysampledata.dart';

// ignore: must_be_immutable
class CartItemWidget extends StatelessWidget {
  String? id;
  String? imgPath;
  String? productName;
  String? price;
  String? description;
  double? rate;
  List<String>? smallPics ;
  RxInt quantity = 1.obs;

  // const List<CartItemWidget> cartItemWidgets ;
  //todo : هذا هلو الكلاس اللي فيه العنصر
  CartItemWidget({
    Key? key,
    this.id,
    this.imgPath,
    this.productName,
    this.price,
    this.description,
    this.rate,
    this.smallPics
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      for(int i=0;i<allProductsList.length;i++){
        if(allProductsList[i]["id"]==id!){
          productName = allProductsList[i]["productName"];
          imgPath = allProductsList[i]["imgPath"];
          description = allProductsList[i]["description"];
          rate = double.parse(allProductsList[i]["rate"]);
          price = allProductsList[i]["price"];
          smallPics = [
            allProductsList[i]["smallPics"][0],
            allProductsList[i]["smallPics"][1],
            allProductsList[i]["smallPics"][2],
            allProductsList[i]["smallPics"][3],];
        }
      }
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
            if(id!.isNotEmpty)
            Image.asset(
              "$imgPath",
              width: 80,
              height: 80,
            ),
            if(id!.isNotEmpty)
            Column(
              children: [
                Text("$productName"),
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
                          return Text("${quantity.value}");
                        }),
                    IconButton(
                        onPressed: () {
                          decrement();
                        },
                        icon: const Icon(CupertinoIcons.minus_circle))
                  ],
                ),
                Text("$price")
              ],
            ),
            if(id!.isNotEmpty)
            SizedBox(
              width: Get.size.width * .8 / 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          setServ.removeItem(this);

                          // print("${item.cartitems}");
                        },
                        icon: const Icon(CupertinoIcons.trash,color: Colors.red,weight: 2,)),
                  ]),
            )
          ],
        ));
  }

  void increment() {
    quantity++;
    setServ.cartController.update();
    setServ.cartController
        .incrementTotalPrice(double.parse(price!));
    Get.put(CartController()).update();
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity--;
      setServ.cartController.totalPrice =
          (setServ.cartController.totalPrice.value -
              double.parse(price!))
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
