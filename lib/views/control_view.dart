
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_ecommerce/helper/sized_box_enum.dart';

import '../view_model/control_view_model.dart';


class ControlView extends StatelessWidget{

   ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return  GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder:(controller)=> Scaffold(
              bottomNavigationBar: _bottomNavigationBar(),
              body: controller.currentScreen),
            );
      }
  }
  Widget  _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => BottomNavigationBar(items: [
        BottomNavigationBarItem(
            label: 'home'.tr,
            icon: SvgPicture.asset("assets/svg/home.svg",fit: BoxFit.contain,width: 20,)),
        BottomNavigationBarItem(
            label: 'Search'.tr,
            icon: SvgPicture.asset("assets/svg/search.svg",fit: BoxFit.contain,width: 20),
            ),
        BottomNavigationBarItem(
            label: 'Wishlist'.tr,
            icon: SvgPicture.asset("assets/svg/heart.svg",fit: BoxFit.contain,width: 20),
        ),
        BottomNavigationBarItem(

            label: 'Profile'.tr,
            icon: SvgPicture.asset("assets/svg/profile.svg",fit: BoxFit.contain,width: 20),
                ),
      ],
        elevation: 0.0,
        currentIndex: controller.navigatorValue,
        onTap: (index) {
        controller.changSelectedValue(index);},
        selectedItemColor: Colors.black87,
        backgroundColor: Colors.grey.shade50,

      ),
    );
  }


