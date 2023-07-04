import '../constants.dart';
import '../controllers/detailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxOfSize extends StatelessWidget {
  final String? size;
  RxBool selected = false.obs;

  BoxOfSize({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        /*
        * todo : هذا الزر يغير قيمة حجم المنتج بناءً على اختيار المُستخدم في ملف
        *  todo: detalsitems.dart
        * */
        selected = true.obs;
        Get.put(DetailsController()).update();
      },
      child: Container(
        width: Get.width / 5 -10 ,
        height: Get.width / 5 -10 ,
        padding: EdgeInsets.all(1/Get.width),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: selected.value == true? Colors.blueAccent:Constants.fontBlackColor)
        ),
        child:Center(child: Text(size!,style: const TextStyle(fontSize: 18,),)) ,
      ),
    );
  }
}
