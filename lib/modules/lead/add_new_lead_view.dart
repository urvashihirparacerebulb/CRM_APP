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
      appBar: commonAppbar(context: context,title: "Create Lead",
        centerTitle: true,
        isLeadingCCustom: true,
        leadingWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Get.back();
            },
            child: neuMorphicWidget(
              radius: 0,
              margin: 0,
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: blackColor,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigation: ColoredBox(
        color: textBgColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(child: commonBorderButtonView(
                      context: context,
                      title: "Cancel",
                      height: 50,
                      tapOnButton: () {
                        Get.back();
                      },
                      isLoading: false)),
                  commonHorizontalSpacing(),
                  Expanded(child: commonFillButtonView(
                      context: context,
                      title: "Submit",
                      height: 50,
                      tapOnButton: () {
                      },
                      isLoading: false)
                  )
                ],
              )
          ),
        ),
      ),
      child: ColoredBox(
        color: textBgColor,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            commonHeaderTitle(title: "Contact Person", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
            commonVerticalSpacing(spacing: 20),
            commonHeaderTitle(title: "Lead Owner", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
                bottom: 25,
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

            commonVerticalSpacing(spacing: 40),
            commonHeaderTitle(title: "Contact Information", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
            commonVerticalSpacing(),
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

            commonVerticalSpacing(spacing: 40),
            commonHeaderTitle(title: "Personal Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
            commonVerticalSpacing(),
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
            commonHeaderTitle(title: "Lead Source", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
                bottom: 25,
                  title: selectedLeadSource == "" ? "Lead Source" : selectedLeadSource,
                  isChangeColor: selectedLeadSource == "" ? true : false
              ),
            ),

            commonHeaderTitle(title: "Stage *", isChangeColor: true,color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
                bottom: 25,
                  title: selectedStage == "" ? "Stage *" : selectedStage,
                  isChangeColor: selectedStage == "" ? true : false
              ),
            ),

            commonHeaderTitle(title: "Industry *", isChangeColor: true,color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
                maxLine: 6,
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
    );
  }
}
