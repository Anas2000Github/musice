import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomListTile {

  static Container
  listTileStyle(
      {
        String? text,
        String? imageUrl,
        Function()? onPressed,

})
  {
    return Container(
      child: ListTile(
        onTap: onPressed,
        title: CustomText(
          text,
        ),
        leading: Image.asset(
            imageUrl.toString()),
        trailing: const Icon(
          Icons.navigate_next,
          color: Colors.black,
        ),
      ),
    );
  }
}



