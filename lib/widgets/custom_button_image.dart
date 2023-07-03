import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_text.dart';
class CustomButtonImage {

  static MaterialButton
  buttonStyle(
      {
        String? imagePath,
        Color? colorButton = Constants.primaryColor,
        Function()? onPressed,
        double? borderSize = 8,
        double? paddingVertical = 18,
        double? paddingHorizontal = 18,
        Color? colorText= Colors.white
      })
  {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderSize!)),
      padding: EdgeInsets.symmetric(vertical: paddingVertical!, horizontal: paddingHorizontal!),
      onPressed: onPressed,
      color: colorButton,
      child: Image.asset(imagePath!,width: 50,height: 50,)
    );
  }
}

