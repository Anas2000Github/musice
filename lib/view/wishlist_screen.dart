
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/helper/sized_box_enum.dart';
import '../constants.dart';

import '../widgets/custom_text.dart';

class WishListScreen extends StatelessWidget {
   WishListScreen({Key? key}) : super(key: key);

   static const kMobileBreakpoint = 576;
   static const kTabletBreakpoint = 1024;
   static const kDesktopBreakPoint = 1366;


  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GridView.builder(

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                  crossAxisSpacing: 5
                ),
                itemCount: 7,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      // Get.to(DetailsView(
                      //   productModel: controller.productModel[index],
                      // ));
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            width: Get.width * .45,
                            color: Constants.backGroundColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Column(
                              children: [
                                Stack(
                                    children: [
                                      Container(
                                          width: Get.width * .4,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius
                                                  .circular(20)
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Image.asset(
                                            'assets/images/headphones.png',
                                            fit: BoxFit.fill,
                                            opacity: const AlwaysStoppedAnimation(
                                                .9),)),
                                      Container(
                                        height: 26,
                                        width: 26,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          left: Get.width * .29,
                                          top: Get.height * .015,),
                                        decoration: BoxDecoration(
                                            color: Constants.backGroundColor,
                                            borderRadius: BorderRadius.circular(
                                                10)
                                        ),
                                        child: const Icon(Icons.delete_outlined,
                                          color: Colors.black87, size: 21,weight: .2),
                                      ),

                                    ]
                                ),
                                5.height,
                                CustomText(
                                  alignment: Alignment.topLeft,
                                  text: 'Zigzag HeadPhone',
                                  color: Constants.fontColor,
                                  fontWeight: FontWeight.w400,
                                  fontsize: 13,
                                ),
                                10.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    CustomText(
                                      alignment: Alignment.topLeft,
                                      text: 'wireless HeadPhone',
                                      fontWeight: FontWeight.w400,
                                      fontsize: 10,
                                    ),
                                    Container(
                                      width: 35,
                                      height: 17,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[100],
                                          borderRadius: BorderRadius.circular(
                                              30)
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star, color: Colors.amber,
                                            size: 12,),
                                          CustomText(
                                            text: '4.9',
                                            fontsize: 10,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                10.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    CustomText(
                                      alignment: Alignment.topLeft,
                                      text: '\$35.00',
                                      color: Constants.fontColor,
                                      fontWeight: FontWeight.w400,
                                      fontsize: 13,
                                    ),
                                    const Icon(Icons.shopping_cart_outlined,
                                      color: Constants.fontColor,)
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  );
                }),
          )
      );
  }
}
