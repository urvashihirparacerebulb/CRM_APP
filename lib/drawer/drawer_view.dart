import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:crm_app/modules/calls/call_list_view.dart';
import 'package:crm_app/modules/meeting/meeting_list_view.dart';
import 'package:crm_app/utility/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';
import '../controllers/general_controller.dart';
import '../modules/tasks/task_list_view.dart';
import '../utility/assets_utility.dart';
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        )
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints){
          return Container(
            decoration: const BoxDecoration(
              color: textBgColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
              )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 42),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Neumorphic(
                       style: const NeumorphicStyle(
                         shape: NeumorphicShape.concave
                       ),
                      child: Image(image: dummyProfileImage),
                    ),
                    InkWell(
                      onTap: (){
                        AuthenticationController.to.advancedDrawerController.value.hideDrawer();
                      },
                      child: neuMorphicWidget(
                        radius: 0,
                        margin: 0.0,
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: blackColor,
                            size: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                commonVerticalSpacing(spacing: 25),
                commonHeaderTitle(title: "John Martin",isChangeColor: true,color: blackColor,fontWeight: 1,fontSize: 1.2),
                commonVerticalSpacing(spacing: 5),
                commonHeaderTitle(title: "Admin",isChangeColor: true,color: fontColor,fontWeight: 0,fontSize: 0.9),
                commonVerticalSpacing(spacing: 30),
                drawerListTile(Icons.dashboard, dashboard, changeIndexOfDashBoard: () {
                  AuthenticationController.to.advancedDrawerController.value.hideDrawer();
                  GeneralController.to.dashBoardTitle.value = dashboard;
                }),
                drawerListTile(Icons.shopping_bag, leads, changeIndexOfDashBoard: () {
                  AuthenticationController.to.advancedDrawerController.value.hideDrawer();
                  GeneralController.to.dashBoardTitle.value = leads;
                }),
                drawerListTile(Icons.shopping_bag, deals, changeIndexOfDashBoard: () {
                  AuthenticationController.to.advancedDrawerController.value.hideDrawer();
                  GeneralController.to.dashBoardTitle.value = deals;
                }),
                drawerListTile(Icons.people, products, changeIndexOfDashBoard: () {
                  AuthenticationController.to.advancedDrawerController.value.hideDrawer();
                  GeneralController.to.dashBoardTitle.value = products;
                }),
                drawerListTile(Icons.local_activity, activities, isExpanded: true, changeIndexOfDashBoard: () {
                  AuthenticationController.to.advancedDrawerController.value.hideDrawer();
                  GeneralController.to.dashBoardTitle.value = activities;
                }),
                drawerListTile(Icons.people, contacts, changeIndexOfDashBoard: () {
                  AuthenticationController.to.advancedDrawerController.value.hideDrawer();
                  GeneralController.to.dashBoardTitle.value = contacts;
                }),
                drawerListTile(Icons.calculate_rounded, accounts, changeIndexOfDashBoard: () {
                  AuthenticationController.to.advancedDrawerController.value.hideDrawer();
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
      {Widget? screenWidget, Function? changeIndexOfDashBoard, bool isExpanded = false}) {
    return Obx(() {
      return Neumorphic(
        // margin: EdgeInsets.only(top: 5),
        style: NeumorphicStyle(
          color: textBgColor,
          depth: -4,
          intensity: (GeneralController.to.dashBoardTitle.value == title) ? 8 : 0
        ),
        // height: isExpanded ? 58 : 52,
        padding: const EdgeInsets.symmetric(vertical: 0),
        // decoration: BoxDecoration(
        //   color: textBgColor,
        //   border: (GeneralController.to.dashBoardTitle.value == title) ? Border.all(color: greyColor) : null
        // ),
        child: isExpanded ? ExpansionTile(
          title: const Text(activities),
          // backgroundColor: ourBlueColor,
          leading: const Icon(Icons.person), //add icon
          childrenPadding: const EdgeInsets.only(left:60), //children padding
          children: [
            ListTile(
              minVerticalPadding: 0,
              title: const Text(tasks),
              onTap: (){
                Get.to(() => const TaskListView());
              },
            ),

            ListTile(
              minVerticalPadding: 0,
              title: const Text(meetings),
              onTap: (){
                Get.to(() => const MeetingListView());
              },
            ),

            ListTile(
              title: const Text(calls),
              onTap: (){
                Get.to(() => const CallListView());
              },
            ),

            //more child menu
          ],
        ) : ListTile(
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0,
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
