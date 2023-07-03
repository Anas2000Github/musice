import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallPic extends StatelessWidget {
  final String? imagePath;
  SmallPic({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        /*todo : هذا الزر إذا كبست عليه ستتبدل الصورة المعروضة في ملف
        *todo : detailsitem.dart
        *todo: جزء من ملف:
         todo: details_view.dart */
      },
      child: Container(
        width: Get.width / 4 - 10,
        height: Get.height / 4 - 10,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagePath!,),
              fit: BoxFit.fill)
        ),
      ),
    );
  }
}
