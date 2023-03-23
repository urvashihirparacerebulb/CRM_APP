import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';

class AccountInfoView extends StatefulWidget {
  const AccountInfoView({Key? key}) : super(key: key);

  @override
  State<AccountInfoView> createState() => _AccountInfoViewState();
}

class _AccountInfoViewState extends State<AccountInfoView> {

  titleSubTitleView({String title = "", subTitle = ""}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
              child: commonHeaderTitle(title: title,fontSize: 1.3,fontWeight: 2)),
          Expanded(flex: 4,child: commonHeaderTitle(title: subTitle,fontSize: 1.3)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          titleSubTitleView(title: "Account\nOwner *",subTitle: "Indian Farmers Fertilizer Cooperative Limited (IFFCO)"),
          titleSubTitleView(title: "Account\nName *",subTitle: "Indian Farmers Fertilizer Cooperative Limited (IFFCO)"),
          titleSubTitleView(title: "Ownership *",subTitle: "Public"),
          titleSubTitleView(title: "Website",subTitle: "www.iffco.in"),
          titleSubTitleView(title: "Industry*",subTitle: "7"),
          titleSubTitleView(title: "Account\nType *",subTitle: "Client"),
          titleSubTitleView(title: "Parent\nAccount",subTitle: "IFFCO"),
          titleSubTitleView(title: "Fax",subTitle: "91-11-42592650"),
          titleSubTitleView(title: "Description",subTitle: "--"),
        ],
      ),
    );
  }
}
