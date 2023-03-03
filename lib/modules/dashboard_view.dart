import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';

import '../utility/color_utility.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  commonDashboardCardView({String title = "", count}){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: neurmorphicBoxDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.dashboard_outlined,size: 60,color: ourBlueColor),
                commonHorizontalSpacing(spacing: 12),
                commonHeaderTitle(title: count,fontWeight: 2,fontSize: 2.7,color: ourBlueColor)
              ],
            ),
            commonVerticalSpacing(spacing: 15),
            commonHeaderTitle(title: title,fontWeight: 1,fontSize: 1.5,color: ourBlueColor,isChangeColor: true)
          ],
        ),
      ),
    );
  }

  dealsCardView(){

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              commonDashboardCardView(title: "Deals",count: "5"),
              commonHorizontalSpacing(),
              commonDashboardCardView(title: "Calls",count: "10"),
            ],
          ),
          commonVerticalSpacing(),
          Row(
            children: [
              commonDashboardCardView(title: "Meetings",count: "15"),
              commonHorizontalSpacing(),
              commonDashboardCardView(title: "Tasks",count: "20"),
            ],
          )
        ],
      ),
    );
  }
}
