import 'dart:convert';

import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:crm_app/configurations/config_file.dart';
import 'package:crm_app/controllers/account_controller.dart';
import 'package:crm_app/controllers/address_controller.dart';
import 'package:crm_app/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../bottom_view/sector_bottom_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../configurations/api_utility.dart';
import '../../model/account_response_model.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';
import '../../utility/screen_utility.dart';
import 'add_pincode_view.dart';

class AddNewAccountView extends StatefulWidget {
  const AddNewAccountView({Key? key}) : super(key: key);

  @override
  State<AddNewAccountView> createState() => _AddNewAccountViewState();
}

class _AddNewAccountViewState extends State<AddNewAccountView> {

  String selectAccType = "";
  Sector? selectIndustry;
  String selectTypeOfSubSector = "";
  String selectedTypeOfAddress = "";
  String selectedAccOwner = "";

  CountryState? selectedPinCode;
  TextEditingController accNameController = TextEditingController();
  TextEditingController parentAccController = TextEditingController();
  TextEditingController accSiteController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController descController = TextEditingController();
  // List<CountryState> arrayList = [];

  @override
  void initState() {
    makeAPICalls();
    super.initState();
  }

  makeAPICalls(){
    AccountController.to.getSectorAPI(callback: (){
      AccountController.to.getAccountOwnerAPI(callback: (){});
    });
  }


  Future<List<CountryState>> getSuggestions(String query) async {
    final response = await APIProvider.getDio().post(ApiConfig.pinCodesURL,
      data: {
        "searchTerm": query
      },
    );
    if (response.statusCode == 200) {
      CountryStateResponseModel countryStateResponseModel = CountryStateResponseModel.fromJson(jsonDecode(response.data));
      final suggestions = countryStateResponseModel.data ?? [];
      return suggestions;
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

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
                          title: selectAccType == "" ? "Account Type" : selectAccType,
                          isChangeColor: selectAccType == "" ? true : false
                      ),
                    ),
                    commonVerticalSpacing(spacing: 20),
                    commonHeaderTitle(title: "Industry *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: Obx(() => SectorBottomView(
                                myItems: AccountController.to.sectorList,
                                selectionCallBack: (
                                    Sector val) {
                                  setState(() {
                                    selectIndustry = val;
                                  });
                                }, title: 'Select Industry *',
                            ))
                        );
                      },
                      child: commonDecoratedTextView(
                        bottom: 0,
                          title: selectIndustry == null ? "Select Industry" : selectIndustry!.name ?? "",
                          isChangeColor: selectIndustry == null ? true : false
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
                                myItems: const ["Corporate Office","Registered Office","Branch Office","Plant/Factory","Other"],
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
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // height: 60,
                              decoration: neurmorphicBoxDecoration,
                              child: StatefulBuilder(
                                builder: (context, newSetState) {
                                  return TypeAheadField(
                                    textFieldConfiguration: TextFieldConfiguration(
                                        autofocus: false,
                                        controller: pinCodeController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none, hintText: 'Pin Code*',
                                          contentPadding: EdgeInsets.only(left: 15),
                                        ),
                                    ),
                                    suggestionsCallback: (pattern) async {
                                      return await getSuggestions(pattern);
                                    },
                                    itemBuilder: (context, CountryState suggestion) {
                                      return ListTile(
                                        title: Text(suggestion.pinCode ?? ""),
                                      );
                                    },
                                    onSuggestionSelected: (CountryState suggestion) {
                                      newSetState(() {
                                        selectedPinCode = suggestion;
                                        pinCodeController.text = selectedPinCode?.pinCode ?? "0";
                                      });
                                    },
                                    suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      elevation: 8.0,
                                      color: Theme.of(context).cardColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          commonHorizontalSpacing(spacing: 15),
                          commonFillButtonView(
                              context: context,
                              title: "New PinCode",
                              width: 120, height: 45,
                              tapOnButton: () {
                                showDialog(context: context, builder: (BuildContext context) => AddPinCodeView(doneCallback: (CountryState countryState, String pin){
                                  AddressController.to.addNewPinCode(
                                      cityId: countryState.id,
                                      pinCode: pin,
                                      callback: (){
                                      }
                                  );
                                }));
                              }, isLoading: false
                          )
                        ],
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
