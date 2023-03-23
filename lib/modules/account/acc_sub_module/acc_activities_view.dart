import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';

class AccountActivityView extends StatefulWidget {
  const AccountActivityView({Key? key}) : super(key: key);

  @override
  State<AccountActivityView> createState() => _AccountActivityViewState();
}

class _AccountActivityViewState extends State<AccountActivityView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return _buildPlayerModelList();
        },
      ),
    );
  }


  Widget _buildPlayerModelList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: neurmorphicBoxDecoration,
      child: const ExpansionTile(
        title: Text(
          "dsvdvdcvcv",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              "dscvd saadcsv asfasffs dsfdsf",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
