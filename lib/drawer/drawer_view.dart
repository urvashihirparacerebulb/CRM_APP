import 'package:crm_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';
import '../utility/color_utility.dart';
import '../utility/theme_utils.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints){
          return Container(
            color: whiteColor,
            padding: EdgeInsets.zero,
            child: ListView(
              shrinkWrap: true,
              children: [
                drawerListTile(Icons.dashboard, dashboard, changeIndexOfDashBoard: () {
                  GeneralController.to.dashBoardTitle.value = dashboard;
                }),
                drawerListTile(Icons.shopping_bag, leads, changeIndexOfDashBoard: () {
                  GeneralController.to.dashBoardTitle.value = leads;
                }),
                drawerListTile(Icons.shopping_bag, deals, changeIndexOfDashBoard: () {
                  GeneralController.to.dashBoardTitle.value = deals;
                }),
                drawerListTile(Icons.people, products, changeIndexOfDashBoard: () {
                  GeneralController.to.dashBoardTitle.value = products;
                }),
                drawerListTile(Icons.local_activity, activities, changeIndexOfDashBoard: () {
                  GeneralController.to.dashBoardTitle.value = activities;
                }),
                drawerListTile(Icons.people, contacts, changeIndexOfDashBoard: () {
                  GeneralController.to.dashBoardTitle.value = contacts;
                }),
                drawerListTile(Icons.calculate_rounded, accounts, changeIndexOfDashBoard: () {
                  GeneralController.to.dashBoardTitle.value = accounts;
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget drawerListTile(IconData image, String title,
      {Widget? screenWidget, Function? changeIndexOfDashBoard}) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 0),
        color: (GeneralController.to.dashBoardTitle.value == title ? ourBlueColor : whiteColor),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0.0),
          onTap: () {
            Get.back();
            if (changeIndexOfDashBoard != null) {
              changeIndexOfDashBoard();
            }
            if (screenWidget != null) {
              Get.to(() => screenWidget);
            }
          },
          tileColor: whiteColor,
          selected: GeneralController.to.dashBoardTitle.value == title,
          selectedTileColor: ourBlueColor,
          leading: SizedBox(
            width: 50,
            child: Icon(image,color: blackColor),
          ),
          title: Text(
            title,
            style: black14PxNormal.copyWith(
              color: blackColor
            ),
          ),
        ),
      );
    });
  }
}
