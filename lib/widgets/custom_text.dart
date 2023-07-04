import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CustomText extends StatelessWidget{

 final String? text;
 final double? fontsize;
 Color? color =Get.isDarkMode? Colors.white:Colors.black;
 final FontWeight? fontWeight;
 final int? maxLines;
 final Alignment? alignment;
 final  double? height;
 final  TextAlign? textAlign;
  double? wordSpacing;

 CustomText( this.text,{

   this.fontsize=16,
   this.color,
   this.fontWeight= FontWeight.normal,
   this.maxLines = 10000,
   this.height= 1.3,
   this.wordSpacing, this.textAlign, this.alignment });


  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: alignment,
      child: Text(
          text.toString(),
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextStyle(
            overflow: TextOverflow.fade,
            wordSpacing: wordSpacing,
            height: height,
            fontSize: fontsize,
            color: color,
            fontWeight: fontWeight,
          ),

      ),
    );
  }
  }


