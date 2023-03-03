import 'package:crm_app/modules/dashboard_view.dart';
import 'package:crm_app/modules/deal/deals_list_view.dart';
import 'package:crm_app/modules/lead/leads_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/common_widgets_view.dart';
import '../controllers/general_controller.dart';
import '../drawer/drawer_view.dart';
import '../utility/assets_utility.dart';
import '../utility/color_utility.dart';
import '../utility/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerView(),
      appBar: commonSearchAppBar(
          context: context,
          leadingWidget: InkWell(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4.0, 4.0, 4.0),
                child: Image(
                  image: menuIcon,
                  color: blackColor,
                ),
              ),
            ),
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          )
      ),
      body: Obx(() => GeneralController.to.dashBoardTitle.value == dashboard ? const DashboardView() :
      GeneralController.to.dashBoardTitle.value == leads ? const LeadsView() :
      GeneralController.to.dashBoardTitle.value == deals ? const DealsView() :
      Container()),
    );
  }
}
