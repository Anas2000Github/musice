import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cartcontroller.dart';

class CartItemWidget extends StatelessWidget {

  final String? id;
  final String? imgPath;
  final String? productName;
  final String? price;
  String quantity;
  // const List<CartItemWidget> cartItemWidgets ;
  //todo : هذا هلو الكلاس اللي فيه العنصر
  CartItemWidget(
      {Key? key,

      this.id,
      this.imgPath,
      this.productName,
      this.price,
      this.quantity="1"})
      : super(key: key);

  CartController cartController = Get.put(CartController(), permanent: true);
  @override
  Widget build(BuildContext context) {

    // CartItem item = CartItem();

    if(setServ.cartController.hideItem == false.obs){
      //todo : الشرط هذا من شان كبسة الحذف
      return  Container(
        margin:
        const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        padding:
        const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        height: 100,
        width: 500,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(253, 248, 248, 248)),
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
                Text("${productName}"),
                // Text(prcStr),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          (Get.put(CartController())).increment();
                          setServ.cartController.incrementTotalPrice(double.parse(price!.substring(1)));
                        },
                        icon: const Icon(CupertinoIcons.plus_circle)),
                    GetBuilder<CartController>(
                        init: Get.put(CartController()),
                        builder: (cartController) {
                          return Text("${cartController.counter}");}),
                    IconButton(
                        onPressed: () {
                          Get.put(CartController()).decrement();
                          setServ.cartController.totalPrice = (setServ.cartController.totalPrice.value
                              - double.parse(price!.substring(1))).obs;
                        },
                        icon: const Icon(CupertinoIcons.minus_circle))
                  ],
                ),
                Text("$price")
              ],
            ),
            SizedBox(
              width: 480 / 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          if(sharePrefs!.getString("productName")=="1")
                          setServ.removeItem(
                              CartItemWidget(
                                id: id!,imgPath: imgPath!,
                                productName: productName!,
                                price: price!, quantity: quantity!,));
                          // print("${item.cartitems}");
                        },
                        icon: const Icon(CupertinoIcons.trash)),
                  ]),
            )
          ],
        )
      );
    }
    else {
      return  Container(
      );
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
