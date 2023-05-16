import 'package:flutter/material.dart';

class addRadioButton {

  static RadioListTile
  addRadio(
      {required ThemeMode val,
        required String title,
        required IconData icon,
        required BuildContext context,
        required dynamic groupValue,
        required void Function(dynamic)? onChanged})
  {
    return RadioListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Icon(icon),
        ],),
      value: val,
      activeColor: Theme.of(context).primaryColor,
      groupValue:groupValue ,
      onChanged: onChanged,
    );
  }
}