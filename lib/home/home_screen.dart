import 'package:crm_app/controllers/authentication_controller.dart';
import 'package:crm_app/modules/dashboard_view.dart';
import 'package:crm_app/modules/deal/deals_list_view.dart';
import 'package:crm_app/modules/lead/leads_list_view.dart';
import 'package:crm_app/utility/assets_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../common_widgets/common_widgets_view.dart';
import '../controllers/general_controller.dart';
import '../drawer/drawer_view.dart';
import '../modules/account/account_list_view.dart';
import '../modules/contacts/contact_list_view.dart';
import '../modules/product/product_list_view.dart';
import '../utility/color_utility.dart';
import '../utility/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: whiteColor,
      controller: AuthenticationController.to.advancedDrawerController.value,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(seconds: 2),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: const DrawerView(),
      child: Scaffold(
        backgroundColor: textBgColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: textBgColor,
            elevation: 0.0,
            centerTitle: true,
            title: Obx(() => Text(GeneralController.to.dashBoardTitle.value,style: const TextStyle(color: subFontColor,fontWeight: FontWeight.bold,fontSize: 18),)),
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: AuthenticationController.to.advancedDrawerController.value,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: neuMorphicWidget(
                      radius: 0,
                      margin: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          color: blackColor,
                          size: 20,
                          key: ValueKey<bool>(value.visible),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Image(image: dummyProfileImage),
              )
            ],
          ),
        ),
        body: Obx(() => GeneralController.to.dashBoardTitle.value == dashboard ? const DashboardView() :
        GeneralController.to.dashBoardTitle.value == leads ? const LeadsView() :
        GeneralController.to.dashBoardTitle.value == deals ? const DealsView() :
        GeneralController.to.dashBoardTitle.value == products ? const ProductListView() :
        GeneralController.to.dashBoardTitle.value == contacts ? const ContactView() :
        GeneralController.to.dashBoardTitle.value == accounts ? const AccountListView() :
        Container()),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    AuthenticationController.to.advancedDrawerController.value.showDrawer();
  }
}
    // return Scaffold(
    //   key: _scaffoldKey,
    //   drawer: const DrawerView(),
    //   appBar: commonSearchAppBar(
    //       context: context,
    //       leadingWidget: InkWell(
    //         child: Container(
    //           alignment: Alignment.centerLeft,
    //           child: Padding(
    //             padding: const EdgeInsets.fromLTRB(20, 4.0, 4.0, 4.0),
    //             child: Image(
    //               image: menuIcon,
    //               color: blackColor,
    //             ),
    //           ),
    //         ),
    //         onTap: () {
    //           _scaffoldKey.currentState!.openDrawer();
    //         },
    //       )
    //   ),
    //   body: Obx(() => GeneralController.to.dashBoardTitle.value == dashboard ? const DashboardView() :
    //   GeneralController.to.dashBoardTitle.value == leads ? const LeadsView() :
    //   GeneralController.to.dashBoardTitle.value == deals ? const DealsView() :
    //   GeneralController.to.dashBoardTitle.value == products ? const ProductListView() :
    //   GeneralController.to.dashBoardTitle.value == contacts ? const ContactView() :
    //   GeneralController.to.dashBoardTitle.value == accounts ? const AccountListView() :
    //   Container()),
    // );
//   }
// }
