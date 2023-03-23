import 'package:crm_app/utility/screen_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../common_widgets/common_widgets_view.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';

class AddContactView extends StatefulWidget {
  const AddContactView({Key? key}) : super(key: key);

  @override
  State<AddContactView> createState() => _AddContactViewState();
}

class _AddContactViewState extends State<AddContactView> {

  String selectedTitle = "";
  String selectedCompany = "";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController reportingToController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController extensionNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController perMobileController = TextEditingController();
  TextEditingController perEmailController = TextEditingController();
  TextEditingController desController = TextEditingController();

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
                    commonHeaderTitle(title: "Title *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Title",
                                myItems: const ["Mr.","Ms.","Mrs.","Dr."],
                                selectionCallBack: (
                                    String val) {
                                  setState(() {
                                    selectedTitle = val;
                                  });
                                })
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 10,
                          title: selectedTitle == "" ? "Type" : selectedTitle,
                          isChangeColor: selectedTitle == "" ? true : false
                      ),
                    ),
                    CommonTextFiled(
                        fieldTitleText: "First Name *",
                        hintText: "First Name *",
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
                        fieldTitleText: "Last Name *",
                        hintText: "Last Name *",
                        textEditingController: lastNameController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "Designation *",
                        hintText: "Designation *",
                        textEditingController: designationController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 25),
                    commonHeaderTitle(title: "Company *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Company *",
                                myItems: const ["scsc qwds","sdcsc","scds"],
                                selectionCallBack: (
                                    String val) {
                                  setState(() {
                                    selectedCompany = val;
                                  });
                                }
                            )
                        );
                      },
                      child: commonDecoratedTextView(
                          bottom: 10,
                          title: selectedCompany == "" ? "Unit Type" : selectedCompany,
                          isChangeColor: selectedCompany == "" ? true : false
                      ),
                    ),
                    CommonTextFiled(
                        fieldTitleText: "Department *",
                        hintText: "Department *",
                        textEditingController: departmentController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }
                    ),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "Reporting to *",
                        hintText: "Reporting to *",
                        textEditingController: reportingToController,
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
                      fieldTitleText: "Mobile No",
                      hintText: "Mobile No",
                      onChangedFunction: (String value){
                      },
                      keyboardType: TextInputType.number,
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }, textEditingController: mobileController,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                        fieldTitleText: "Phone No",
                        hintText: "Phone No",
                        keyboardType: TextInputType.number,
                        onChangedFunction: (String value){
                        },
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }, textEditingController: phoneNoController
                    ),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                        fieldTitleText: "Extention No",
                        hintText: "Extention No",
                        keyboardType: TextInputType.number,
                        onChangedFunction: (String value){
                        },
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }, textEditingController: extensionNoController
                    ),
                    commonVerticalSpacing(spacing: 20),
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

              commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(title: "Residential Address", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
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
                      fieldTitleText: "Address",
                      hintText: "Address",
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }, textEditingController: addressController,
                    ),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                      fieldTitleText: "PinCode",
                      hintText: "PinCode",
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }, textEditingController: pinCodeController,
                    ),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                      fieldTitleText: "City",
                      hintText: "City",
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }, textEditingController: cityController,
                    ),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                      fieldTitleText: "State",
                      hintText: "State",
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }, textEditingController: stateController,
                    ),
                    commonVerticalSpacing(spacing: 20),
                    Container(
                      decoration: neurmorphicBoxDecoration,
                      child: IntlPhoneField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                          hintText: "Country",
                          counterText: ""
                        ),
                        onChanged: (phone) {
                          if (kDebugMode) {
                            print(phone.completeNumber);
                          }
                        },
                        onCountryChanged: (country) {
                          if (kDebugMode) {
                            print('Country changed to: ${country.name}');
                          }
                        },
                      ),
                    ),
                    // CommonTextFiled(
                    //   fieldTitleText: "Country",
                    //   hintText: "Country",
                    //   onChangedFunction: (String value){
                    //   },
                    //   validationFunction: (String value) {
                    //     return value.toString().isEmpty
                    //         ? notEmptyFieldMessage
                    //         : null;
                    //   }, textEditingController: countryController,
                    // ),
                  ],
                ),
              ),

              commonVerticalSpacing(spacing: 20),
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
                      fieldTitleText: "Mobile No",
                      hintText: "Mobile No",
                      onChangedFunction: (String value){
                      },
                      keyboardType: TextInputType.number,
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }, textEditingController: perMobileController,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    commonVerticalSpacing(spacing: 20),
                    CommonTextFiled(
                        fieldTitleText: "Email Address * ",
                        hintText: "Email Address * ",
                        textEditingController: perEmailController,
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
                        fieldTitleText: "Description",
                        hintText: "Description",
                        textEditingController: desController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                    commonVerticalSpacing(spacing: 20),
                    commonHeaderTitle(title: "Profile Photo", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(),
                    Container(
                      padding: const EdgeInsets.all(24),
                      width: getScreenWidth(context),
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.camera,size: 30),
                          commonVerticalSpacing(),
                          commonHeaderTitle(title: "Select Image", isChangeColor: true, color: blackColor, fontSize: 1.2,fontWeight: 2),
                          commonVerticalSpacing(),
                          commonHeaderTitle(title: "Supports JPG,PNG,JPEG", isChangeColor: true, color: greyColor, fontSize: 1.0,fontWeight: 2),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
