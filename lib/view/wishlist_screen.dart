import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/helper/sized_box_enum.dart';
import '../constants.dart';
import '../widgets/custom_text.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                childAspectRatio: .78,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount:7,
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
                      elevation:10,
                      child: Container(
                        width: Get.width*.45,
                        height: Get.height * .3,
                        color: Constants.backGroundColor,
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                        child: Column(
                          children: [
                            Stack(
                                children:[
                                  Container(
                                      width: Get.width * .4,
                                      height: Get.height * .17,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                    child: Icon(Icons.delete_outlined,
                                      color: Colors.grey[300],size: 21,),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey[100],
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child:  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.amber,size: 12,),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  alignment: Alignment.topLeft,
                                  text: '\$35.00',
                                  color: Constants.fontColor,
                                  fontWeight: FontWeight.w400,
                                  fontsize: 13,
                                ),
                                Icon(Icons.shopping_cart_outlined,color: Constants.fontColor,)
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
      ));
  }
}
