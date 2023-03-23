import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../common_widgets/common_widgets_view.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';

class AddNewCallView extends StatefulWidget {
  const AddNewCallView({Key? key}) : super(key: key);

  @override
  State<AddNewCallView> createState() => _AddNewCallViewState();
}

class _AddNewCallViewState extends State<AddNewCallView> {

  TextEditingController meetingNameController = TextEditingController();
  TextEditingController locationNameController = TextEditingController();
  TextEditingController participantsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isRepeat = false;
  bool isReminder = false;
  String selectedRelatedTo = "";
  String selectedDeals = "";

  @override
  Widget build(BuildContext context) {
    return commonStructure(context: context,
        appBar: commonAppbar(context: context,title: "Add Meeting",
            centerTitle: true,
            isLeadingCCustom: true,
            leadingWidget: InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined,color: blackColor))
        ),
        child: ColoredBox(
          color: secondaryColor,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              commonHeaderTitle(title: "Meeting Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                decoration: neurmorphicBoxDecoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFiled(
                        fieldTitleText: "Meeting Name *",
                        hintText: "Meeting Name *",
                        textEditingController: meetingNameController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }
                    ),
                    commonVerticalSpacing(spacing: 20),
                    // Container(
                    //     height: 50,
                    //     padding: EdgeInsets.symmetric(horizontal: commonHorizontalPadding),
                    //     decoration: neurmorphicBoxDecoration,
                    //     child: Stack(
                    //       children: [
                    //         Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: commonHeaderTitle(
                    //                 fontSize: isTablet() ? 1.3 : 1,
                    //                 height: 1.2,
                    //                 title: selectDueDate.isEmpty ? "Select Due Date" : selectDueDate)
                    //         ),
                    //         Align(
                    //             alignment: Alignment.centerRight,
                    //             child: InkWell(
                    //               onTap: () {
                    //                 openCalendarView(
                    //                   context,
                    //                   initialDate: DateTime.now().toString(),
                    //
                    //                 ).then((value) {
                    //                   setState(() {
                    //                     selectDueDate = DateFormat("dd/MM/yyyy").format(value);
                    //                   });
                    //                 });
                    //               },
                    //               child: Icon(Icons.calendar_month, color: blackColor.withOpacity(0.4)),
                    //             )),
                    //       ],
                    //     )),
                    commonVerticalSpacing(spacing: 20),
                    commonCheckBoxTile(title: "Repeat",callback: (bool val){
                      setState(() {
                        isRepeat = val;
                      });
                    },isSelected: isRepeat),
                    commonCheckBoxTile(title: "Reminder",callback: (bool val){
                      setState(() {
                        isReminder = val;
                      });
                    },isSelected: isReminder),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                        fieldTitleText: "Location Name *",
                        hintText: "Location Name *",
                        textEditingController: locationNameController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }
                    ),
                    commonVerticalSpacing(spacing: 20),
                    commonHeaderTitle(title: "Related To", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Related To",
                                myItems: const ["dcsdc","sdvdhgg","scds","cssd"],
                                selectionCallBack: (String val) {
                                  setState(() {
                                    selectedRelatedTo = val;
                                  });
                                }
                            )
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 0,
                          title: selectedRelatedTo == "" ? "Related To" : selectedRelatedTo,
                          isChangeColor: selectedRelatedTo == "" ? true : false
                      ),
                    ),
                    commonVerticalSpacing(spacing: 20),
                    commonHeaderTitle(title: "Deals", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Deals",
                                myItems: const ["dcsdc","hjn","scds","saa","ssa"],
                                selectionCallBack: (String val) {
                                  setState(() {
                                    selectedDeals = val;
                                  });
                                }
                            )
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 0,
                          title: selectedDeals == "" ? "Deals" : selectedDeals,
                          isChangeColor: selectedDeals == "" ? true : false
                      ),
                    ),
                    commonVerticalSpacing(),
                    CommonTextFiled(
                        fieldTitleText: "Participants",
                        hintText: "Participants",
                        textEditingController: participantsController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }
                    ),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                        fieldTitleText: "Description",
                        hintText: "Description",
                        maxLine: 4,
                        textEditingController: descriptionController,
                        onChangedFunction: (String value){

                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }
                    ),
                    commonVerticalSpacing(spacing: 20),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
