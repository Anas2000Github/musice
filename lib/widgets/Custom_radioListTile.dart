import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDelevery {

  static RadioListTile
  listTileStyle(
      {
        String? tiltleText,
        String? subtitleText,
        dynamic? value,
        dynamic? groupValue,
        Function(dynamic)? onChanged,

      })
  {
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      title: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
           tiltleText!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,

          ),


        ),
      ),
      subtitle: Container(
        alignment: Alignment.bottomLeft,
        child: Text(
        subtitleText!,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),

        ),
      ),
      value: value,
      groupValue:groupValue,
      onChanged:onChanged,
      activeColor: Constants.primaryColor,
    );
  }
}

