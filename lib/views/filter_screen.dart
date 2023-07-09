import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_ecommerce/constants.dart';
import 'package:project_ecommerce/helper/sized_box_enum.dart';
import '../views/temp1.dart';
import 'package:project_ecommerce/view_model/check_out_view_model.dart';
import 'package:project_ecommerce/widgets/custom_button.dart';
import 'package:project_ecommerce/widgets/custom_text.dart';

import '../widgets/custom_check_box.dart';

class  FilterColorScreen extends StatefulWidget {
  const FilterColorScreen({Key? key}) : super(key: key);

  @override
  State<FilterColorScreen> createState() => _FilterColorScreenState();
}

class _FilterColorScreenState extends State<FilterColorScreen> {
  double _value = 0.0;
  bool isBrands1 = false;
  bool isBrands2 = false;
  bool isBrands3 = false;
  bool isBrands4 = false;

  bool isTage1 = false;
  bool isTage2= false;
  bool isTage3 = false;
  bool isTage4 = false;

  bool isColors1 = false;
  bool isColors2 = false;
  bool isColors3 = false;
  bool isColors4 = false;
  bool isColors5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               listBox1('Brands'),
              listBox2('Tage'),
              10.height,
              CustomText(
                'Price Range',
                fontsize: 21,
                color: Constants.fontColor,
                alignment: Alignment.topLeft,
              ),
              10.height,
              CustomText(
                '\$$_value',
                fontsize: 21,
                color: Constants.fontColor,
                alignment: Alignment.topLeft,
              ),
              10.height,
              Slider(
                  min: 0,
                  max: 1000,
                  divisions: 20,
                  activeColor: Constants.primaryColor,
                  value: _value,
                  onChanged: (value) {
                    _value = value;
                    setState(() {
                      print(value);
                    });
                  }),
              listBox3('Colors'),
              30.height,
              Center(
                child: CustomButton.buttonStyle(
                    onPressed: () {
                      Get.to(Temp1());
                    }, text: 'Filter', paddingHorizontal: Get.width*.33),
              ),
              10.height,
            ],
          ),
        ),
      ),
    );
  }

  listBox1(String textTile) {
    return GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) => SizedBox(
            width: Get.width * .3,
            child: Column(children: [
                  SizedBox(
                    height: Get.height*.27,
                    child: ListView(
                      shrinkWrap: false,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      children: [
                        CustomText(
                          textTile,
                          fontsize: 21,
                          color: Constants.fontColor,
                        ),
                        CustomBox.listTileStyle(
                          color: Colors.black87,
                            value: isBrands1,
                            onChanged: (val){
                              setState(() {});
                              isBrands1=val;
                            },
                            text: 'Apex'
                        ),
                        CustomBox.listTileStyle(
                          color: Colors.black87,
                            value: isBrands2,
                            onChanged: (val){
                              setState(() {});
                              isBrands2=val;
                            },
                              text: 'Zara'
                        ),
                        CustomBox.listTileStyle(
                          color: Colors.black87,
                            value: isBrands3,
                            onChanged: (val){
                              setState(() {});
                              isBrands3=val;
                            },
                            text: 'Adidas'
                        ),
                        CustomBox.listTileStyle(
                          color: Colors.black87,
                            value: isBrands4,
                            onChanged: (val){
                              setState(() {

                              });
                              isBrands4=val;
                            },
                            text: 'Apple'
                        ),

                      ],
                    ),
                  ),

            ])));
  }
  listBox2(String textTile) {
    return GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) => SizedBox(
            width: Get.width * .3,
            child: Column(children: [
              SizedBox(
                height: Get.height*.26,
                child: ListView(
                  shrinkWrap: false,
                  padding: EdgeInsets.all(5),
                  children: [
                    CustomText(
                      textTile,
                      fontsize: 21,
                      color: Constants.fontColor,
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.black87,
                        value: isTage1,
                        onChanged: (val){
                          setState(() {

                          });
                          isTage1=val;
                        },
                        text: 'Laptop'
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.black87,
                        value: isTage2,
                        onChanged: (val){
                          setState(() {

                          });
                          isTage2=val;
                        },
                        text: 'T-Shirt'
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.black87,
                        value: isTage3,
                        onChanged: (val){
                          setState(() {

                          });
                          isTage3=val;
                        },
                        text: 'Camera'
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.black87,
                        value: isTage4,
                        onChanged: (val){
                          setState(() {

                          });
                          isTage4=val;
                        },
                        text: 'Frog'
                    ),

                  ],
                ),
              ),

            ])));
  }
  listBox3(String textTile) {
    return  SizedBox(
        width: Get.width * .3,
        child: GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) => Column(children: [
              SizedBox(
                height: Get.height*.3,
                child: ListView(
                  shrinkWrap: false,
                  padding: EdgeInsets.all(5),
                  children: [
                    CustomText(
                      textTile,
                      fontsize: 21,
                      color: Constants.fontColor,
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.blue,
                        value: isColors1,
                        onChanged: (val){
                          setState(() {

                          });
                          isColors1=val;
                        },
                        text: 'Blue'
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.black,
                        value: isColors2,
                        onChanged: (val){
                          setState(() {

                          });
                          isColors2=val;
                        },
                        text: 'Black'
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.purple,
                        value: isColors3,
                        onChanged: (val){
                          setState(() {

                          });
                          isColors3=val;
                        },
                        text: 'Purple'
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.red,
                        value: isColors4,
                        onChanged: (val){
                          setState(() {

                          });
                          isColors4=val;
                        },
                        text: 'Red'
                    ),
                    CustomBox.listTileStyle(
                        color: Colors.orange,
                        value: isColors5,
                        onChanged: (val){
                          setState(() {

                          });
                          isColors5=val;
                        },
                        text: 'Orange'
                    ),

                  ],
                ),
              ),

            ])));
  }

}
