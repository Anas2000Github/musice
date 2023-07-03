import 'package:project_ecommerce/view/cartpage.dart';

import '../constants.dart';
import '../widgets/cartitem.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/cartcontroller.dart';
import '../main.dart';
import '../services/settingssettings.dart';
import '../widgets/cartitem.dart';

class Temp1 extends GetView<SettingsServices> {
  Temp1({Key? key}) : super(key: key);
  late Map<String,Function> process;
  CartController cont = Get.put(CartController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(title: Text("Temp1"),),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: Get.width*.8,
              child: InkWell(
                onTap: (){
                    setServ.addItemtoCart(
                        CartItemWidget(
                            id: "1",
                            price: "\$20",
                            productName: "prod1",
                            imgPath: "assets/images/shoes/shoes1.png"),
                        );

                  Get.to(CartPage());
      }
                ,
                child: Card(
                  color: Colors.grey.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only
                      (left: 5.0, right: 5.0, top: 2,bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/shoes/shoes1.png",
                        width: 100, height: 100,),
                        const Icon(Icons.add_shopping_cart, size: 20,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width*.8,
              child: InkWell(
                onTap: (){
                    setServ.addItemtoCart(
                        CartItemWidget(
                          id: "2",
                          productName: "prod2",
                          price: "\$18",
                          imgPath:
                              "assets/images/shoes/shoes2.png",
                        ),


                        );

                    Get.to(CartPage());
      }
                ,
                child: Card(
                  color: Colors.grey.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only
                      (left: 5.0, right: 5.0, top: 2,bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/shoes/shoes2.png",
                        width: 100, height: 100,),
                        const Icon(Icons.add_shopping_cart, size: 20,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
