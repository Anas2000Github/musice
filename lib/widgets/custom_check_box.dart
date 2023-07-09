import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text.dart';

class CustomBox {

  static Container
  listTileStyle(
      {
        String? text,
        required Color color,
        required bool value,
       required void Function(bool) onChanged,

      })
  {
    return Container(
      width: Get.size.width,
      height: Get.height*.045,
      child: Row(
        children: [
          CustomCheckBox(
            borderColor: color,
            checkedFillColor: color,
            value: value,
            onChanged: onChanged,
          ),
          CustomText(
            text,
          ),
        ],
      ),
    );
  }
}

