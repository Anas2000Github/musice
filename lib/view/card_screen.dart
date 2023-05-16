import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_ecommerce/constants.dart';
import 'package:project_ecommerce/helper/sized_box_enum.dart';
import 'package:project_ecommerce/view_model/check_out_view_model.dart';
import 'package:project_ecommerce/widgets/custom_button.dart';
import 'package:project_ecommerce/widgets/custom_text.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _listBox(4, 'Brands'),
              _listBox(4, 'Tage'),
              CustomText(
                text: 'Price Range',
                fontsize: 21,
                color: Constants.fontColor,
                alignment: Alignment.topLeft,
              ),
              10.height,
              CustomText(
                text: '\$500',
                fontsize: 21,
                color: Constants.fontColor,
                alignment: Alignment.topLeft,
              ),
              10.height,
              Slider(
                activeColor: Constants.primaryColor,
                  value: .5, onChanged: (value) {}),
              _listBox(5, 'Colors'),
              30.height,
              CustomButton.buttonStyle(
                  onPressed: () {}, text: 'Filter', paddingHorizontal: 150),
              10.height,
            ],
          ),
        ),
      ),
    );
  }
}

_listBox(int indexChange, String textTile) {
  return GetBuilder<CheckOutViewModel>(
    init: CheckOutViewModel(),
    builder: (controller) => Container(
      width: Get.width * .9,
      child: Column(
        children: [
          CustomText(
            alignment: Alignment.topLeft,
            text: textTile,
            fontsize: 21,
            color: Constants.fontColor,
          ),
          Container(
            height: Get.height * .2,
            alignment: Alignment.topLeft,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width * .4,
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color:  indexChange == 4 && index == 1 ? Colors.black : Colors.white70,
                          border: Border.all(
                              color: indexChange == 5
                                  ? controller.colors[index]
                                  : Colors.black54,
                              width: 1.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      10.width,
                      CustomText(
                        text: (() {
                          if (textTile == 'Brands') {
                            if (index == 0) {
                              return 'Apex';
                            } else if (index == 1) {
                              return 'Zara';
                            } else if (index == 2) {
                              return 'Adidas';
                            } else if (index == 3) {
                              return 'Apple';
                            }
                          } else if (textTile == 'Tag') {
                            if (index == 0) {
                              return 'Laptop';
                            } else if (index == 1) {
                              return 'T-Shirt';
                            } else if (index == 2) {
                              return 'Camera';
                            } else if (index == 3) {
                              return 'Frog';
                            }
                          } else {
                            if (index == 0) {
                              return 'Blue';
                            } else if (index == 1) {
                              return 'Black';
                            } else if (index == 2) {
                              return 'Purple';
                            } else if (index == 3) {
                              return 'Red';
                            } else {
                              return 'Orange';
                            }
                          }
                        }()),
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => 6.height,
              itemCount: indexChange,
            ),
          ),
        ],
      ),
    ),
  );
}
