import '../controllers/cartcontroller.dart';
import '../main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/cartitemsmodel.dart';
import '../widgets/cartitem.dart';

//هذا الملف المُخَصَّصِ لعرضِ صفحة سلة وعربة الأغراض المُختارة لِشِرائها قبل شِرائها
class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  //ثوابت يجب تغييرها

  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    CartItems ci = CartItems();
    // CartItemWidget ciw = CartItemWidget();
    return Scaffold(
      appBar: AppBar(
        title: const Text("bill"),
      ),
      // color: Color(rgb(232, 240, 253)),
      //بإمكانك تغيير لون الخلفية من هون /\
      backgroundColor: const Color.fromARGB(57, 144, 154, 170),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                    //هنا يتم عرض المُنتج الواحد أو السِّلعة الواحدة
                    //{
                    setServ.items.map((e)  {
                      if(setServ.cartController.hideItem.isFalse){
                        return e;
                      }
                      return Text("This item is not available");})
                    .toList(),
                //} نهاية عرض السِّلَع
              ),
              //مسافة 50
              const SizedBox(
                height: 50,
              ),
              //النواتج
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    //Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontSize: 18),
                        ),
                        GetBuilder<CartController>(
                          builder: (context) {
                            return Text("${context.totalPrice}");
                          }
                        )
                      ],
                    ),
                    //Shipping
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Shipping",
                          style: TextStyle(fontSize: 18),
                        ),
                        GetBuilder<CartController>(

                          builder: (controller) {
                            return Text("${controller.shipping}");
                          }
                        )
                      ],
                    ),
                    //Shoe's price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Shoes",
                          style: TextStyle(fontSize: 18),
                        ),
                        GetBuilder(
                          init: CartController(),
                          builder: (controller) {
                            return Text("${controller.unitPrice}");
                          }
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //مسافة 50
              const SizedBox(
                height: 50,
              ),
              //زر إتمام عملية الشراء
              //Proceed to checkout
              TextButton(
                  onPressed: () {},
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
                    child: const Center(
                        child: Text(
                      /*------->*/ "Proceed to Checkout", //<------
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                  ))
              //نهاية الزر
            ],
          ),
        ),
      ),
    );
  }
}
