import 'package:project_ecommerce/constants.dart';

import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cartcontroller.dart';

// ignore: must_be_immutable
class CartItemWidget extends StatelessWidget {
  final String? id;
  final String? imgPath;
  final String? productName;
  final String? price;
  RxInt quantity = 1.obs;

  // const List<CartItemWidget> cartItemWidgets ;
  //todo : هذا هلو الكلاس اللي فيه العنصر
  CartItemWidget({
    Key? key,
    this.id,
    this.imgPath,
    this.productName,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CartItem item = CartItem();

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
