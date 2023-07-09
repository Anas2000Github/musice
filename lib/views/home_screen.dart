import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/helper/sized_box_enum.dart';
import 'package:project_ecommerce/main.dart';
import 'package:project_ecommerce/views/details_view.dart';
import 'package:project_ecommerce/widgets/custom_text.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const Drawer(),
      backgroundColor: Constants.backGroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: Get.width,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Expanded(
                         child: Row(children: [
                           Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Image.asset('assets/images/Avatar.png'),
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               SizedBox(
                                 width: Get.width*.29,
                                 child: CustomText(
                                   'Hello'.tr,
                                   fontsize: 14,
                                   fontWeight: FontWeight.w400,
                                   color: Constants.fontBlackColor,
                                 ),
                               ),
                               CustomText(
                                 'Anas Abdallah'.tr,
                                 fontsize: 15,
                                 fontWeight: FontWeight.w400,
                                 color: Constants.fontColor,
                               ),
                             ],
                           ),
                         ],
                         ),
                       ),

                           InkWell(
                             onTap: (){
                               _scaffoldKey.currentState!.openEndDrawer();
                             },
                               child: SvgPicture.asset('assets/svg/menu-scale.svg'))

                  ], ),
              ),
              Stack(
                  children:[
                    Container(
                      margin: const EdgeInsets.only(bottom: 10,top: 15),
                      width: Get.width*.9,
                      height: Get.height*.25,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Constants.primaryColor,
                        elevation: 5,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        width: Get.width*.3,
                                        alignment: Alignment.topRight,
                                        child: SvgPicture.asset('assets/svg/circle.svg',color: Colors.amber,)),
                                    10.height,
                                    RotationTransition(
                                      turns:  const AlwaysStoppedAnimation(-7 / 360),
                                      child:  CustomText(
                                        'Beat Always\nHeat'.tr,
                                        fontsize: 23,
                                        color: Constants.backGroundColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    CustomText(
                                      'Only \$10.00',
                                      color: Colors.amber,
                                      fontsize: 23,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    10.height,
                                  ],),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                        width: Get.width,
                        child: Image.asset('assets/images/headphones.png')),
                ]
                ),
              Container(
                height: Get.height * .1,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Get.to(DetailsView(
                        //   productModel: controller.productModel[index],
                        // ));

                      },
                      child: Stack(children: [
                          SizedBox(
                              width: Get.width * .25,
                              height: Get.height * .12,
                              child:ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset('assets/images/camera.jpg',fit: BoxFit.fill,)),),
                          Container(
                              width: Get.width * .25,
                              height: Get.height * .15,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.35),
                                borderRadius: BorderRadius.circular(8.0)
                              ),
                              padding: const EdgeInsets.only(bottom: 5),
                              alignment: Alignment.bottomCenter,
                              child: CustomText(
                                'Camera',
                                color: Constants.backGroundColor,
                                fontWeight: FontWeight.w500,
                                fontsize: 12.5,
                              )),

                        ],),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => 10.width,
                ),
              ),
                 20.height,
                 Container(
                  height: Get.height * .34,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ListView.separated(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Get.to(DetailsView(
                          //   productModel: controller.productModel[index],
                          // ));
                        },
                        child: Column(
                          children: [
                            Card(
                              elevation:10,
                              child: Container(
                                width: Get.width*.43,
                                height: Get.height * .3,
                                color: Constants.backGroundColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10,vertical: 6),
                                child: Column(
                                  children: [
                                    Stack(
                                      children:[
                                        Container(
                                            width: Get.width * .45,
                                            height: Get.height * .17,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(20)
                                            ),
                                            padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child:Image.asset('assets/images/headphones.png',fit: BoxFit.fill,
                                                opacity: const AlwaysStoppedAnimation(.9),)),
                                        Container(
                                          height: 26,
                                          width: 26,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(left:Get.width * .29,top: Get.height * .015, ),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[500],
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Icon(Icons.favorite_border,
                                                color: Colors.grey[300],size: 18,),
                                          ),

                                    ]
                                    ),
                                    5.height,
                                    CustomText(
                                      alignment: Alignment.topLeft,
                                      'Zigzag HeadPhone',
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w400,
                                      fontsize: 13,
                                    ),
                                    10.height,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          alignment: Alignment.topLeft,
                                          'wireless HeadPhone',
                                          fontWeight: FontWeight.w400,
                                          fontsize: 10,
                                        ),
                                        Container(
                                          width: 35,
                                          height: 17,
                                          padding: const EdgeInsets.symmetric(horizontal: 3),
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey[100],
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                          child:  Row(
                                            children: [
                                              const Icon(Icons.star,color: Colors.amber,size: 12,),
                                              CustomText(
                                                '4.9',
                                                fontsize: 10,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    10.height,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          alignment: Alignment.topLeft,
                                          '\$35.00',
                                          color: Constants.fontColor,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 13,
                                        ),
                                        const Icon(Icons.shopping_cart_outlined,color: Constants.fontColor,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => 10.width,
                  ),
                 ),
              CustomText(
                  alignment: Alignment.topLeft,
                  'Special For Gaming',
              ),
              SizedBox(
                width: Get.width,
                height: Get.height * .35,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Get.to(DetailsView(
                        //   productModel: controller.productModel[index],
                        // ));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              elevation:10,
                              child: Container(
                                width: Get.size.width*.8,
                                height: Get.height * .12,
                                color: Constants.backGroundColor,
                                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                     Expanded(
                                       child: FittedBox(
                                         child: Container(
                                            height: Get.height * .17,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child:Image.asset('assets/images/headphones.png',fit: BoxFit.fill,
                                              opacity: const AlwaysStoppedAnimation(.9),)),
                                       ),
                                     ),
                                    SizedBox(
                                      width: Get.width*.5,
                                      height: Get.height * .1,
                                      child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: FittedBox(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                CustomText(
                                                  alignment: Alignment.topLeft,
                                                  'Game Controller',
                                                  color: Constants.fontColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontsize: 15,
                                                ),
                                                CustomText(
                                                  alignment: Alignment.topLeft,
                                                  'Fast Work',
                                                  fontWeight: FontWeight.w400,
                                                  fontsize: 13,
                                                ),
                                                CustomText(
                                                  alignment: Alignment.topLeft,
                                                  '\$50.00',
                                                  color: Constants.fontColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontsize: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                height: Get.width*.05,
                                                width: Get.width*.05,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: const Icon(Icons.favorite,
                                                  color: Colors.red,size: 18,),
                                              ),
                                              Container(
                                                width: 35,
                                                height: 17,
                                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                                decoration: BoxDecoration(
                                                    color: Colors.blueGrey[50],
                                                    borderRadius: BorderRadius.circular(30)
                                                ),
                                                child:  Row(
                                                  children: [
                                                    const Icon(Icons.star,color: Colors.amber,size: 15,),
                                                    CustomText(
                                                      '4.9',
                                                      fontsize: 10,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => 10.width,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
