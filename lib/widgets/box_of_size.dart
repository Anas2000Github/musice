import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxOfSize extends StatelessWidget {
  final String? size;
  BoxOfSize({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        /*
        * todo : هذا الزر يغير قيمة حجم المنتج بناءً على اختيار المُستخدم في ملف
        *  todo: detalsitems.dart
        * */
      },
      child: Container(
        width: Get.width / 4 - 10,
        height: Get.height / 4 - 10,
        padding: EdgeInsets.all(1/Get.width),
        margin: const EdgeInsets.all(10),
        child:Text(size!,style: const TextStyle(fontSize: 14,),) ,
      ),
    );
  }
}
