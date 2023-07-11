import '../mysampledata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../views/details_view.dart';
import 'cartitem.dart';
class ProductItem extends StatelessWidget {
  String? id;
  String? imgPath;
  String? productName;
  String? price;
  String? description;
  double? rate;
  RxInt quantity = 1.obs;
   List<String>? smallPics ;

  ProductItem({Key? key,
    this.id,
    this.price,
    this.productName,
    this.imgPath,
    this.description,
    this.rate,
    this.smallPics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    for(int i=0;i<allProductsList.length;i++){
      if(allProductsList[i]["id"]==id!){
        productName = allProductsList[i]["productName"];
        description = allProductsList[i]["description"];
        imgPath = allProductsList[i]["imgPath"];
        rate = double.parse(allProductsList[i]["rate"]);
        price = allProductsList[i]["price"];
        smallPics = [
          allProductsList[i]["smallPics"][0],
          allProductsList[i]["smallPics"][1],
          allProductsList[i]["smallPics"][2],
          allProductsList[i]["smallPics"][3],];
      }
    }
    return SizedBox(
      width: Get.width*.8,
      child: Card(
        color: Colors.grey.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap:(){
                // Get.to(DetailsView(id: "2",
                //   productName: "prod2",
                //   price: "\$18",
                //   imgPath:
                //   "assets/images/shoes/shoes2.png",
                //   smallPics: const [
                //     "assets/images/shoes/shoes2.png",
                //     "assets/images/shoes/shoes2.png",
                //     "assets/images/shoes/shoes2.png",
                //     "assets/images/shoes/shoes2.png",],),
                // );

                if(id!.isNotEmpty)
                {setServ.cartController.currentPrice = (double.parse(price!.substring(price!.indexOf("\$")+1))).obs;
                setServ.cartController.totalPrice = (setServ.cartController.totalPrice.value + setServ.cartController.currentPrice.value).obs;
                Get.to(()=>DetailsView(id: id!,
                  productName: productName!,
                  price: "\$${price!}",
                  imgPath: imgPath!,
                  smallPics: smallPics!),
                );}

              },
              child: Image.asset(imgPath!,
                width: 100, height: 100,),
            ),
            InkWell(
              onTap: (){
                if(id!.isNotEmpty){
                  setServ.addItemtoCart(
                    CartItemWidget(
                      id: id!,
                      productName: productName!,
                      price: "\$${price!}",
                      imgPath: imgPath!,
                      rate: rate!,
                      description: description,
                    ),
                  );
                  Get.toNamed("/cartPage");
                }
              },
              child: const Padding(
                padding: EdgeInsets.only
                  (left: 5.0, right: 5.0, top: 2,bottom: 2),
                child: Icon(Icons.add_shopping_cart, size: 20,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
