import 'package:crm_app/modules/deal/add_new_deal_view.dart';
import 'package:crm_app/utility/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widgets/common_widgets_view.dart';
import '../../utility/screen_utility.dart';

class DealsView extends StatefulWidget {
  const DealsView({Key? key}) : super(key: key);

  @override
  State<DealsView> createState() => _DealsViewState();
}

class _DealsViewState extends State<DealsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          commonVerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonHeaderTitle(title: "All Deals", fontSize: isTablet() ? 1.5 : 1.3, fontWeight: 4,isChangeColor: true,color: greyColor),
              commonFillButtonView(
                  context: context,
                  title: "+ Deal",
                  width: 70,
                  height: 35,
                  tapOnButton: () {
                    Get.to(() => const AddNewDealView());
                  },
                  isLoading: false)
            ],
          ),
          commonVerticalSpacing(),
          Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8,right: 8),
                decoration: neurmorphicBoxDecoration,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(title: "DEAL NAME", fontSize: 1.3,fontWeight: 2),
                        Switch(
                          activeColor: ourBlueColor,
                          activeTrackColor: Colors.cyan,
                          inactiveThumbColor: Colors.blueGrey.shade600,
                          inactiveTrackColor: Colors.grey.shade400,
                          splashRadius: 50.0,
                          value: true,
                          onChanged: (value){

                          },
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(title: "COMPANY NAME", fontSize: 1),
                        commonHeaderTitle(title: "ACCOUNT OWNER", fontSize: 1),
                      ],
                    ),
                    commonVerticalSpacing(spacing: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(title: "STAGE", fontSize: 1),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade200
                              ),
                                child: const Icon(Icons.edit,color: ourBlueColor,size: 20,)),
                            commonHorizontalSpacing(),
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade200
                                ),
                                child: const Icon(Icons.delete,color: ourBlueColor,size: 20,))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
          },))
        ],
      ),
    );
  }
}
