import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';

import '../utility/color_utility.dart';
import '../utility/screen_utility.dart';

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

  dealsDataView(){
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonHeaderTitle(title: "Today's All Calls",fontWeight: 4,fontSize: 1.5,color: blackColor,isChangeColor: true),
            const Icon(Icons.more_horiz)
          ],
        )
      ],
    );
  }

  getDataRows(){
    final List<DataRow> _rows = [];
    for (int i = 0; i < 5; i++) {
      _rows.add(DataRow(
        cells: [
          DataCell(commonHeaderTitle(title: (i+1).toString(),fontWeight: 1,fontSize: 1.2)),
          DataCell(commonHeaderTitle(title: "Urvashi",fontWeight: 1,fontSize: 1.2)),
          DataCell(commonHeaderTitle(title: "Ramani",fontWeight: 1,fontSize: 1.2)),
          DataCell(commonHeaderTitle(title: "ssadsfdsdv vsdvd",fontWeight: 1,fontSize: 1.2)),
          DataCell(commonHeaderTitle(title: "dvsd xcsdfs sdcdscd",fontWeight: 1,fontSize: 1.2)),
        ],
      ));
    }
    return _rows;
  }

  todayAllCalls(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonHeaderTitle(title: "Today's All Calls",fontWeight: 4,fontSize: 1.5,color: blackColor,isChangeColor: true),
        commonVerticalSpacing(),
        SizedBox(
          width: getScreenWidth(context),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: commonHeaderTitle(isChangeColor: true, color: greyColor,title: "SR NO.",fontSize: 1.2,fontWeight: 2)),
                DataColumn(label: commonHeaderTitle(isChangeColor: true, color: greyColor,title: "First Name",fontSize: 1.2,fontWeight: 2)),
                DataColumn(label: commonHeaderTitle(isChangeColor: true, color: greyColor,title: "Last Name",fontSize: 1.2,fontWeight: 2)),
                DataColumn(label: commonHeaderTitle(isChangeColor: true, color: greyColor,title: "Description",fontSize: 1.2,fontWeight: 2)),
                DataColumn(label: commonHeaderTitle(isChangeColor: true, color: greyColor,title: "Call Agenda",fontSize: 1.2,fontWeight: 2)),
              ],
              rows: getDataRows(),
            ),
          ),
        )

      ],
    );
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
          ),
          commonVerticalSpacing(spacing: 20),
          todayAllCalls(),
          commonVerticalSpacing(spacing: 20),
          dealsDataView()
        ],
      ),
    );
  }
}
