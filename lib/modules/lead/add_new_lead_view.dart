import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';

class AddNewLeadView extends StatefulWidget {
  const AddNewLeadView({Key? key}) : super(key: key);

  @override
  State<AddNewLeadView> createState() => _AddNewLeadViewState();
}

class _AddNewLeadViewState extends State<AddNewLeadView> {

  String selectedLeadOwner = "";
  String selectedCompany = "";
  String selectedLeadSource = "";
  String selectedStage = "";
  String selectedIndustry = "";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      appBar: commonAppbar(context: context,title: "Add Lead",
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
            commonHeaderTitle(title: "Contact Person", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
            commonVerticalSpacing(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              decoration: neurmorphicBoxDecoration,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonHeaderTitle(title: "Lead Owner", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Lead Owner",
                              myItems: const ["JAY DARJI","HITESH PATEL"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedLeadOwner = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedLeadOwner == "" ? "Lead Owner" : selectedLeadOwner,
                        isChangeColor: selectedLeadOwner == "" ? true : false
                    ),
                  ),

                  commonHeaderTitle(title: "Company *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Company *",
                              myItems: const ["abc test","sdvfsdg"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedCompany = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedCompany == "" ? "Company *" : selectedCompany,
                        isChangeColor: selectedCompany == "" ? true : false
                    ),
                  ),

                  commonHeaderTitle(title: "Title *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Title *",
                              myItems: const ["advdfbc test","sdvfsdg"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedCompany = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedCompany == "" ? "Title *" : selectedCompany,
                        bottom: 0,
                        isChangeColor: selectedCompany == "" ? true : false
                    ),
                  ),
                  commonVerticalSpacing(spacing: 15),
                  CommonTextFiled(
                      fieldTitleText: "First Name * ",
                      hintText: "First Name * ",
                      textEditingController: firstNameController,
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }),
                  commonVerticalSpacing(spacing: 15),
                  CommonTextFiled(
                      fieldTitleText: "Last Name * ",
                      hintText: "Last Name * ",
                      textEditingController: lastNameController,
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }),
                ],
              ),
            ),

            commonVerticalSpacing(spacing: 30),
            commonHeaderTitle(title: "Contact Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
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
                      fieldTitleText: "Email Address * ",
                      hintText: "Email Address * ",
                      textEditingController: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }),

                  commonVerticalSpacing(spacing: 20),
                  CommonTextFiled(
                    fieldTitleText: "Mobile No",
                    hintText: "Mobile No",
                    keyboardType: TextInputType.number,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChangedFunction: (String value){
                    },
                    validationFunction: (String value) {
                      return value.toString().isEmpty
                          ? notEmptyFieldMessage
                          : null;
                    }, textEditingController: mobileNoController,),

                  commonVerticalSpacing(spacing: 20),
                  CommonTextFiled(
                      fieldTitleText: "Phone No",
                      hintText: "Phone No",
                      keyboardType: TextInputType.number,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }, textEditingController: phoneNoController),

                  commonVerticalSpacing(spacing: 20),
                  CommonTextFiled(
                      fieldTitleText: "Fax",
                      hintText: "Fax",
                      textEditingController: faxController,
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }),
                ],
              ),
            ),

            commonVerticalSpacing(spacing: 30),
            commonHeaderTitle(title: "Personal Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
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
                      fieldTitleText: "Website",
                      hintText: "Website",
                      textEditingController: websiteController,
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }),
                  commonVerticalSpacing(spacing: 20),
                  commonHeaderTitle(title: "Lead Source", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Lead Source",
                              myItems: const ["wssssxss","ssssss"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedLeadSource = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedLeadSource == "" ? "Lead Source" : selectedLeadSource,
                        isChangeColor: selectedLeadSource == "" ? true : false
                    ),
                  ),


                  commonHeaderTitle(title: "Stage *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Stage *",
                              myItems: const ["abc test","sdvfsdg","cdfcdsfc","dsfsdf"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedStage = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedStage == "" ? "Stage *" : selectedStage,
                        isChangeColor: selectedStage == "" ? true : false
                    ),
                  ),

                  commonHeaderTitle(title: "Industry *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Industry *",
                              myItems: const ["sfsdf","sdvfsdg","cdfcdsfc","dsfsdf"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedIndustry = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedIndustry == "" ? "Industry *" : selectedIndustry,
                        isChangeColor: selectedIndustry == "" ? true : false
                    ),
                  ),

                  CommonTextFiled(
                      fieldTitleText: "Description",
                      hintText: "Description",
                      textEditingController: descriptionController,
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
