import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
    return ListView(
      shrinkWrap: true,
      children: [
        Neumorphic(
            margin: const EdgeInsets.all(10),
            style: const NeumorphicStyle(
            color: textBgColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonVerticalSpacing(),
                commonHeaderTitle(title: "Deals", fontSize: 1.3, isChangeColor: true,color: fontColor,fontWeight: 2),
                commonVerticalSpacing(),
                SizedBox(height: 320,child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Neumorphic(
                        style: const NeumorphicStyle(
                          depth: 5,
                          color: textBgColor
                        ),
                        margin: const EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              commonHeaderTitle(title: "Qualification (0)", fontSize: 1.3, isChangeColor: true,color: subFontColor,align: TextAlign.center,fontWeight: 1),
                              commonVerticalSpacing(spacing: 15),
                              Container(width: getScreenWidth(context) / 2,height: 2,color: whiteColor),
                              commonVerticalSpacing(spacing: 15),
                              Container(
                                width: getScreenWidth(context)/2,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonHeaderTitle(title: "Test", fontSize: 1.3, isChangeColor: true,color: blackColor,fontWeight: 2),
                                        const Icon(Icons.info, color: blackColor)
                                      ],
                                    ),
                                    commonVerticalSpacing(),
                                    commonHeaderTitle(title: "Deal Company Represent Company Contact", fontSize: 0.8, isChangeColor: true,color: greyColor),
                                    commonVerticalSpacing(),
                                    commonHeaderTitle(title: "Daniel Summerbell", fontSize: 1, isChangeColor: true,color: blackColor),
                                  ],
                                ),
                              ),
                              commonVerticalSpacing(spacing: 20),
                              Container(
                                width: getScreenWidth(context)/2,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonHeaderTitle(title: "Test", fontSize: 1.3, isChangeColor: true,color: blackColor,fontWeight: 2),
                                        const Icon(Icons.info, color: blackColor)
                                      ],
                                    ),
                                    commonVerticalSpacing(),
                                    commonHeaderTitle(title: "Deal Company Represent Company Contact", fontSize: 0.8, isChangeColor: true,color: greyColor),
                                    commonVerticalSpacing(),
                                    commonHeaderTitle(title: "Daniel Summerbell", fontSize: 1, isChangeColor: true,color: blackColor),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      );
                    },
                )),
                commonVerticalSpacing(),
              ],
            ),
          )
        ),
        commonVerticalSpacing(spacing: 20),
        Neumorphic(
            margin: const EdgeInsets.all(10),
            style: const NeumorphicStyle(
                color: textBgColor
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonVerticalSpacing(),
                  commonHeaderTitle(title: "Leads", fontSize: 1.3, isChangeColor: true,color: fontColor,fontWeight: 2),
                  commonVerticalSpacing(),
                  SizedBox(height: 310,child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Neumorphic(
                          style: const NeumorphicStyle(
                              depth: 5,
                              color: textBgColor
                          ),
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                commonHeaderTitle(title: "New Leads (11)", fontSize: 1.3, isChangeColor: true,color: subFontColor,align: TextAlign.center,fontWeight: 1),
                                commonVerticalSpacing(spacing: 15),
                                Container(width: getScreenWidth(context) / 2,height: 2,color: whiteColor),
                                commonVerticalSpacing(spacing: 15),
                                Container(
                                  width: getScreenWidth(context)/2,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      commonHeaderTitle(title: "Sirish Nadkarni", fontSize: 1.2, isChangeColor: true,color: blackColor),
                                      commonVerticalSpacing(),
                                      commonHeaderTitle(title: "Decor Home Fabric Pvt. Ltd.", fontSize: 0.8, isChangeColor: true,color: greyColor),
                                    ],
                                  ),
                                ),
                                commonVerticalSpacing(spacing: 20),
                                Container(
                                  width: getScreenWidth(context)/2,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      commonHeaderTitle(title: "Sirish Nadkarni", fontSize: 1.2, isChangeColor: true,color: blackColor),
                                      commonVerticalSpacing(),
                                      commonHeaderTitle(title: "Decor Home Fabric Pvt. Ltd.", fontSize: 0.8, isChangeColor: true,color: greyColor),
                                    ],
                                  ),
                                ),

                                commonVerticalSpacing(spacing: 20),
                                Container(
                                  width: getScreenWidth(context)/2,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      commonHeaderTitle(title: "Sirish Nadkarni", fontSize: 1.2, isChangeColor: true,color: blackColor),
                                      commonVerticalSpacing(),
                                      commonHeaderTitle(title: "Decor Home Fabric Pvt. Ltd.", fontSize: 0.8, isChangeColor: true,color: greyColor),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      );
                    },
                  )),
                  commonVerticalSpacing(),
                ],
              ),
            )
        ),
        commonVerticalSpacing(spacing: 20),
        Neumorphic(
            margin: const EdgeInsets.all(10),
            style: const NeumorphicStyle(
                color: textBgColor
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonVerticalSpacing(),
                  commonHeaderTitle(title: "Tasks", fontSize: 1.3, isChangeColor: true,color: fontColor,fontWeight: 2),
                  commonVerticalSpacing(),
                  Neumorphic(
                    style: const NeumorphicStyle(
                        depth: 5,
                        color: textBgColor
                    ),
                    margin: const EdgeInsets.all(10),
                    child: ListView.separated(
                      // shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index){
                        return Container(margin: const EdgeInsets.symmetric(horizontal: 10),color: whiteColor,height: 1);
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              neuMorphicWidget(
                                  shape: NeumorphicShape.concave,
                                  radius: 24,
                                  margin: 0,child: Image.network("https://crm.cerebulb.com/images/company/company_logo_43984.jpg",
                                height: 40,width: 40,)),
                              commonHorizontalSpacing(spacing: 20),
                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  commonVerticalSpacing(spacing: 5),
                                  commonHeaderTitle(title: "Demo",
                                      fontSize: 1,
                                      isChangeColor: true,color: subFontColor
                                  ),
                                  commonVerticalSpacing(spacing: 8),
                                  commonHeaderTitle(title: "AVEVA Group plc",
                                      fontSize: 1.2,
                                      fontWeight: 1,
                                      isChangeColor: true,color: blackColor
                                  ),
                                  commonVerticalSpacing(spacing: 8),
                                  commonHeaderTitle(title: "03/04/2023 12:00 PM",
                                      fontSize: 0.8,
                                      isChangeColor: true,color: subFontColor
                                  ),
                                  commonVerticalSpacing(spacing: 5),
                                ],
                              ))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  commonVerticalSpacing(),
                ],
              ),
            )
        ),
        commonVerticalSpacing(spacing: 20),
        Neumorphic(
            margin: const EdgeInsets.all(10),
            style: const NeumorphicStyle(
                color: textBgColor
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonVerticalSpacing(),
                  commonHeaderTitle(title: "Meetings", fontSize: 1.3, isChangeColor: true,color: fontColor,fontWeight: 2),
                  commonVerticalSpacing(),
                  Neumorphic(
                    style: const NeumorphicStyle(
                        depth: 5,
                        color: textBgColor
                    ),
                    margin: const EdgeInsets.all(10),
                    child: ListView.separated(
                      // shrinkWrap: true,
                      itemCount: 4,
                      separatorBuilder: (context, index){
                        return Container(margin: const EdgeInsets.symmetric(horizontal: 10),color: whiteColor,height: 1);
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              neuMorphicWidget(
                                  shape: NeumorphicShape.concave,
                                  radius: 24,
                                  margin: 0,child: Image.network("https://crm.cerebulb.com/images/company/company_logo_43984.jpg",
                                height: 40,width: 40,)),
                              commonHorizontalSpacing(spacing: 20),
                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  commonVerticalSpacing(spacing: 5),
                                  commonHeaderTitle(title: "Event 1",
                                      fontSize: 1,
                                      isChangeColor: true,color: subFontColor
                                  ),
                                  commonVerticalSpacing(spacing: 8),
                                  commonHeaderTitle(title: "AVEVA Group plc",
                                      fontSize: 1.2,
                                      fontWeight: 1,
                                      isChangeColor: true,color: blackColor
                                  ),
                                  commonVerticalSpacing(spacing: 8),
                                  commonHeaderTitle(title: "03/04/2023 12:00 PM",
                                      fontSize: 0.8,
                                      isChangeColor: true,color: subFontColor
                                  ),
                                  commonVerticalSpacing(spacing: 5),
                                ],
                              ))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  commonVerticalSpacing(),
                ],
              ),
            )
        ),
        commonVerticalSpacing(spacing: 20),
        Neumorphic(
            margin: const EdgeInsets.all(10),
            style: const NeumorphicStyle(
                color: textBgColor
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonVerticalSpacing(),
                  commonHeaderTitle(title: "Calls", fontSize: 1.3, isChangeColor: true,color: fontColor,fontWeight: 2),
                  commonVerticalSpacing(),
                  Neumorphic(
                    style: const NeumorphicStyle(
                        depth: 5,
                        color: textBgColor
                    ),
                    margin: const EdgeInsets.all(10),
                    child: ListView.separated(
                      // shrinkWrap: true,
                      itemCount: 3,
                      separatorBuilder: (context, index){
                        return Container(margin: const EdgeInsets.symmetric(horizontal: 10),color: whiteColor,height: 1);
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              neuMorphicWidget(
                                  shape: NeumorphicShape.concave,
                                  radius: 24,
                                  margin: 0,child: Image.network("https://crm.cerebulb.com/images/company/company_logo_43984.jpg",
                                height: 40,width: 40,)),
                              commonHorizontalSpacing(spacing: 20),
                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  commonVerticalSpacing(spacing: 8),
                                  commonHeaderTitle(title: "AVEVA Group plc",
                                      fontSize: 1.2,
                                      fontWeight: 1,
                                      isChangeColor: true,color: blackColor
                                  ),
                                  commonVerticalSpacing(spacing: 8),
                                  commonHeaderTitle(title: "03/04/2023 12:00 PM",
                                      fontSize: 0.8,
                                      isChangeColor: true,color: subFontColor
                                  ),
                                  commonVerticalSpacing(spacing: 5),
                                ],
                              ))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  commonVerticalSpacing(),
                ],
              ),
            )
        ),
        commonVerticalSpacing(spacing: 20)
      ],
    );
  }
}
