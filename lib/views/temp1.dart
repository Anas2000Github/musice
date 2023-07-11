import '../views/search_page.dart';
import '../widgets/productItem.dart';
import '../constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/settingssettings.dart';
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
                id:"5"),
              ProductItem(id:"2"),
              ProductItem(id:"3"),
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
