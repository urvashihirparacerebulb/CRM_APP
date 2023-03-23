import 'package:crm_app/modules/calls/add_new_call_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widgets_view.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';

class CallListView extends StatefulWidget {
  const CallListView({Key? key}) : super(key: key);

  @override
  State<CallListView> createState() => _CallListViewState();
}

class _CallListViewState extends State<CallListView> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(context: context,title: "Calls",
            centerTitle: true,
            isLeadingCCustom: true,
            leadingWidget: InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined,color: blackColor))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              commonVerticalSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonHeaderTitle(title: "All Calls", fontSize: isTablet() ? 1.5 : 1.3, fontWeight: 4,isChangeColor: true,color: greyColor),
                  commonFillButtonView(
                      context: context,
                      title: "+ Call",
                      width: 90,
                      height: 35,
                      tapOnButton: () {
                        Get.to(() => const AddNewCallView());
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonHeaderTitle(title: "CALL TYPE", fontSize: 1.3,fontWeight: 2),
                            commonHeaderTitle(title: "CALL START TIME", fontSize: 1.1),
                          ],
                        ),
                        commonVerticalSpacing(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonHeaderTitle(title: "CALL DURATION", fontSize: 1.1),
                            commonHeaderTitle(title: "OWNER", fontSize: 1.1),
                          ],
                        ),
                        commonVerticalSpacing(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonHeaderTitle(title: "RELATED TO", fontSize: 1),
                            Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.yellow.shade800
                                    ),
                                    child: const Icon(Icons.edit,color: whiteColor,size: 20,)),
                                commonHorizontalSpacing(),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.redAccent.shade200
                                    ),
                                    child: const Icon(Icons.delete_outline,color: whiteColor,size: 20,)),
                                commonHorizontalSpacing(),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.redAccent.shade200
                                    ),
                                    child: const Icon(Icons.circle_outlined,color: whiteColor,size: 20,))
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
        )
    );
  }
}
