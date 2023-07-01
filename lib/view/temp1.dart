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
      appBar: AppBar(title: Text("Temp1"),),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                  setServ.addItemtoCart(
                      CartItemWidget(
                          id: "1",
                          price: "\$20",
                          productName: "prod1",
                          imgPath: "assets/images/shoes/shoes1.jpg"),
                      );

                Get.toNamed("/cartPage");
      }
              ,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only
                    (left: 5.0, right: 5.0, top: 2,bottom: 2),
                  child: Column(
                    children: [
                      const Icon(Icons.add_shopping_cart, size: 20,),
                      Image.asset("assets/images/shoes/shoes1.jpg",
                        width: 100, height: 100,),
                    ],
                  ),
                ),
              ),
            ),InkWell(
              onTap: (){

                  setServ.addItemtoCart(
                      CartItemWidget(
                        id: "2",
                        productName: "prod2",
                        price: "\$18",
                        imgPath:
                            "assets/images/shoes/341883963_584937046920002_7869963513158198924_n-transformed.png",
                      ),

                      );

                Get.toNamed("/cartPage");
      }
              ,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only
                    (left: 5.0, right: 5.0, top: 2,bottom: 2),
                  child: Column(
                    children: [
                      const Icon(Icons.add_shopping_cart, size: 20,),
                      Image.asset("assets/images/shoes/341883963_584937046920002_7869963513158198924_n-transformed.png",
                        width: 100, height: 100,),
                    ],
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
