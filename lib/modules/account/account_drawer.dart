import 'package:crm_app/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/general_controller.dart';
import '../../utility/color_utility.dart';
import '../../utility/theme_utils.dart';

class AccountDrawer extends StatefulWidget {
  const AccountDrawer({Key? key}) : super(key: key);

  @override
  State<AccountDrawer> createState() => _AccountDrawerState();
}

class _AccountDrawerState extends State<AccountDrawer> {
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
                drawerListTile(Icons.dashboard, accountInformation, changeIndexOfDashBoard: () {
                  GeneralController.to.accountTitle.value = accountInformation;
                  GeneralController.to.accountTitle.refresh();
                }),
                drawerListTile(Icons.shopping_bag, accountAddress, changeIndexOfDashBoard: () {
                  GeneralController.to.accountTitle.value = accountAddress;
                  setState(() {

                  });
                }),
                drawerListTile(Icons.shopping_bag, accountContacts, changeIndexOfDashBoard: () {
                  GeneralController.to.accountTitle.value = accountContacts;
                  GeneralController.to.accountTitle.refresh();
                }),
                drawerListTile(Icons.people, accountNotes, changeIndexOfDashBoard: () {
                  GeneralController.to.accountTitle.value = accountNotes;
                }),
                drawerListTile(Icons.local_activity, accountActivity, changeIndexOfDashBoard: () {
                  GeneralController.to.accountTitle.value = accountActivity;
                }),
                drawerListTile(Icons.people, accountDeals, changeIndexOfDashBoard: () {
                  GeneralController.to.accountTitle.value = accountDeals;
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
