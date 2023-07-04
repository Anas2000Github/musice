import '../view/details_view.dart';
import '../widgets/productItem.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(title: const Text("Temp1"),),
      body: Center(
        child: Column(
          children: [
            ProductItem(id:"1", imgPath: "assets/images/shoes/shoes1.jpg",productName: "prod1",price: "20"
            ,smallPics: ["assets/images/shoes/shoes2.png","assets/images/shoes/shoes1.jpg","assets/images/shoes/shoes1.jpg","assets/images/shoes/shoes1.jpg"],),
            ProductItem(id:"2", imgPath: "assets/images/shoes/shoes2.png",productName: "prod2",price: "18",
            smallPics: ["assets/images/shoes/shoes1.jpg","assets/images/shoes/shoes2.png","assets/images/shoes/shoes3.png","assets/images/shoes/shoes2.png"],),
            ProductItem(id:"3", imgPath: "assets/images/shoes/shoes3.png",productName: "prod3",price: "22",
            smallPics: ["assets/images/shoes/shoes3.png","assets/images/shoes/shoes2.png","assets/images/shoes/shoes1.jpg","assets/images/shoes/shoes2.png"],),
          ],
        ),

      ),
    );
  }


}
