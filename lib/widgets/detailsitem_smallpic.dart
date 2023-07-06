import '../constants.dart';
import '../controllers/detailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallPic extends StatelessWidget {
  final String? imagePath;
  RxBool selected =false.obs;

  SmallPic({Key? key, required this.imagePath}) : super(key: key);
  DetailsController detailsController = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        /*todo : هذا الزر إذا كبست عليه ستتبدل الصورة المعروضة في ملف
        *todo : detailsitem.dart
        *todo: جزء من ملف:
         todo: details_view.dart */
        detailsController.setImagePath(imagePath!);
        selected = true.obs;
        detailsController.update();
      },
      child: Container(
        width: 75,
        height: 75,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color:selected.value == true? Colors.indigo : Constants.fontBlackColor),
          borderRadius: BorderRadius.circular(15),
          color:Constants.backGroundColor
        ),
        child: Image.asset(imagePath!,width: 100, height: 100,),
      ),
    );
  }
}
