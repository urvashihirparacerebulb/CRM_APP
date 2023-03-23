import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widgets_view.dart';
import '../../controllers/general_controller.dart';
import '../../utility/assets_utility.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';
import 'acc_sub_module/acc_activities_view.dart';
import 'acc_sub_module/acc_address_view.dart';
import 'acc_sub_module/acc_contacts_view.dart';
import 'acc_sub_module/acc_info_view.dart';
import 'acc_sub_module/acc_notes_view.dart';
import 'account_drawer.dart';

class AccountDetailView extends StatefulWidget {
  const AccountDetailView({Key? key}) : super(key: key);

  @override
  State<AccountDetailView> createState() => _AccountDetailViewState();
}

class _AccountDetailViewState extends State<AccountDetailView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AccountDrawer(),
      appBar: commonSearchAppBar(
          context: context,
          title: GeneralController.to.accountTitle.value,
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
      body: Obx(() => GeneralController.to.accountTitle.value == accountInformation ? const AccountInfoView() :
      GeneralController.to.accountTitle.value == accountAddress ? const AccountAddressView() :
      GeneralController.to.accountTitle.value == accountContacts ? const AccountContactsView() :
      GeneralController.to.accountTitle.value == accountNotes ? const AccountNotesView() :
      GeneralController.to.accountTitle.value == accountActivity ? const AccountActivityView() :
      // GeneralController.to.dashBoardTitle.value == accounts ? const AccountListView() :
      Container()),
    );
  }
}
