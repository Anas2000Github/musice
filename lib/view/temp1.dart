import '../view/details_view.dart';
import '../view/search_page.dart';
import '../widgets/productItem.dart';

import '../constants.dart';
import '../widgets/cartitem.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/cartcontroller.dart';
import '../main.dart';
import '../services/settingssettings.dart';
import '../widgets/cartitem.dart';
import '../widgets/custom_text.dart';

class Temp1 extends GetView<SettingsServices> {
  Temp1({Key? key}) : super(key: key);
  late Map<String,Function> process;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      appBar: AppBar(title: const Text("Temp1"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ProductItem(
                id:"1", imgPath: "assets/images/shoes/shoes1.jpg",productName: "prod1",price: "20"
              ,smallPics: const ["assets/images/shoes/shoes2.png",
                "assets/images/shoes/shoes1.jpg","assets/images/shoes/shoes1.jpg","assets/images/shoes/shoes1.jpg"],
              description: "best",
              rate: 4.5,),
              ProductItem(id:"2", imgPath: "assets/images/shoes/shoes2.png",productName: "prod2",price: "18",
                description: "crostol kolompos",
                rate: 3.0,
              smallPics: const ["assets/images/shoes/shoes1.jpg","assets/images/shoes/shoes2.png","assets/images/shoes/shoes3.png","assets/images/shoes/shoes2.png"],),
              ProductItem(id:"3", imgPath: "assets/images/shoes/shoes3.png",productName: "prod3",price: "22",
                description: "basterma beljubna",
                rate: 2.7,
              smallPics: const ["assets/images/shoes/shoes3.png","assets/images/shoes/shoes2.png","assets/images/shoes/shoes1.jpg","assets/images/shoes/shoes2.png"],),

            SizedBox(
              height: 200,
              width: 200,
              child: TextButton(onPressed: (){
                Get.to(()=>SearchPage());
              },
              child: CircleAvatar(radius: 50,backgroundColor: Colors.purple,
                  child: CustomText("search",fontsize: 20,color: Colors.white,)),),
            )
            ],
          ),

        ),
      ),
    );
  }


}
