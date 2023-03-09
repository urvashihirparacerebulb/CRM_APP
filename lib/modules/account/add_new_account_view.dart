import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';

class AddNewAccountView extends StatefulWidget {
  const AddNewAccountView({Key? key}) : super(key: key);

  @override
  State<AddNewAccountView> createState() => _AddNewAccountViewState();
}

class _AddNewAccountViewState extends State<AddNewAccountView> {

  String selectAccType = "";
  String selectIndustry = "";
  String selectTypeOfSubSector = "";
  String selectedTypeOfAddress = "";
  String selectedPinCode = "";
  String selectedAccOwner = "";

  TextEditingController accNameController = TextEditingController();
  TextEditingController parentAccController = TextEditingController();
  TextEditingController accSiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(context: context,
        appBar: commonAppbar(context: context,title: "Add Contact",
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
              commonHeaderTitle(title: "Account Type", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                decoration: neurmorphicBoxDecoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonHeaderTitle(title: "Account Type *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Account Type",
                                myItems: const ["Client","Vendor","Channel Partner"],
                                selectionCallBack: (
                                    String val) {
                                  setState(() {
                                    selectAccType = val;
                                  });
                                })
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 0,
                          title: selectAccType == "" ? "Type" : selectAccType,
                          isChangeColor: selectAccType == "" ? true : false
                      ),
                    ),
                    commonVerticalSpacing(spacing: 20),
                    commonHeaderTitle(title: "Industry *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Industry *",
                                myItems: const ["scsc qwds","sdcsc","scds"],
                                selectionCallBack: (
                                    String val) {
                                  setState(() {
                                    selectIndustry = val;
                                  });
                                }
                            )
                        );
                      },
                      child: commonDecoratedTextView(
                        bottom: 0,
                          title: selectIndustry == "" ? "Industry" : selectIndustry,
                          isChangeColor: selectIndustry == "" ? true : false
                      ),
                    ),
                    commonVerticalSpacing(spacing: 20),
                    commonHeaderTitle(title: "Type of Sub Sectors *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Type of Sub Sectors *",
                                myItems: const ["scsc qwds","sdcsc","scds","scsd","scds"],
                                selectionCallBack: (
                                    String val) {
                                  setState(() {
                                    selectTypeOfSubSector = val;
                                  });
                                }
                            )
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 10,
                          title: selectTypeOfSubSector == "" ? "Type of Sub Sectors" : selectTypeOfSubSector,
                          isChangeColor: selectTypeOfSubSector == "" ? true : false
                      ),
                    ),
                  ],
                ),
              ),
              commonVerticalSpacing(spacing: 20),

              commonHeaderTitle(title: "Account Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
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
                        fieldTitleText: "Account Name *",
                        hintText: "Account Name *",
                        textEditingController: accNameController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                        fieldTitleText: "Parent Account",
                        hintText: "Parent Account",
                        textEditingController: parentAccController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 20),
                  ],
                ),
              ),
              commonVerticalSpacing(spacing: 20),

              commonHeaderTitle(title: "Address Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                decoration: neurmorphicBoxDecoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonHeaderTitle(title: "Type of Address", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Type of Address",
                                myItems: const ["Client","Vendor","Channel Partner"],
                                selectionCallBack: (
                                    String val) {
                                  setState(() {
                                    selectedTypeOfAddress = val;
                                  });
                                })
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 10,
                          title: selectedTypeOfAddress == "" ? "Type of Address" : selectedTypeOfAddress,
                          isChangeColor: selectedTypeOfAddress == "" ? true : false
                      ),
                    ),

                    CommonTextFiled(
                        fieldTitleText: "Account Site",
                        hintText: "Account Site",
                        textEditingController: accSiteController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "Address",
                        hintText: "Address",
                        textEditingController: addressController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 20),
                    commonHeaderTitle(title: "PinCode", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "PinCode",
                                myItems: const ["35345","56665","45354","76576","68764"],
                                selectionCallBack: (
                                    String val) {
                                  setState(() {
                                    selectedPinCode = val;
                                  });
                                }
                            )
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 0,
                          title: selectedPinCode == "" ? "PinCode" : selectedPinCode,
                          isChangeColor: selectedPinCode == "" ? true : false
                      ),
                    ),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "City",
                        hintText: "City",
                        textEditingController: cityController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "State",
                        hintText: "State",
                        textEditingController: stateController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "Country",
                        hintText: "Country",
                        textEditingController: countryController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 20),

                  ],
                ),
              ),
              commonVerticalSpacing(spacing: 20),

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

                    commonVerticalSpacing(spacing: 15),
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
                    commonVerticalSpacing(spacing: 15),
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
                    commonVerticalSpacing(spacing: 15),
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
                    commonVerticalSpacing(spacing: 20),
                  ],
                ),
              ),
              commonVerticalSpacing(spacing: 20),

              commonHeaderTitle(title: "Other Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
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
                        fieldTitleText: "Description",
                        hintText: "Description",
                        textEditingController: descController,
                        maxLine: 4,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 20),
                    Row(
                      children: [
                        commonHeaderTitle(title: "Profile Photo", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                        commonHorizontalSpacing(),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.camera,size: 30,),
                              commonVerticalSpacing(),
                              commonHeaderTitle(title: "Supports JPG,PNG,JPEG", isChangeColor: true, color: greyColor, fontSize: 1.0,fontWeight: 2),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              commonVerticalSpacing(spacing: 20),

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
                    commonHeaderTitle(title: "Account Owner *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Account Owner",
                                myItems: const ["Client","Vendor","Channel Partner"],
                                selectionCallBack: (
                                    String val) {
                                  setState(() {
                                    selectedAccOwner = val;
                                  });
                                })
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 10,
                          title: selectedAccOwner == "" ? "Account Owner" : selectedAccOwner,
                          isChangeColor: selectedAccOwner == "" ? true : false
                      ),
                    ),
                  ],
                ),
              ),
              commonVerticalSpacing(spacing: 20),
            ],
          ),
        )
    );
  }
}
