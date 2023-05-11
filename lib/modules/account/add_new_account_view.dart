import 'dart:convert';
import 'dart:io';

import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:crm_app/configurations/config_file.dart';
import 'package:crm_app/controllers/account_controller.dart';
import 'package:crm_app/controllers/address_controller.dart';
import 'package:crm_app/model/address_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../bottom_view/owner_bottom_view.dart';
import '../../bottom_view/sector_bottom_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../configurations/api_utility.dart';
import '../../model/account_response_model.dart';
import '../../model/login_response_model.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';
import '../../utility/theme_utils.dart';
import 'add_pincode_view.dart';

class AddNewAccountView extends StatefulWidget {
  final bool isEdit;
  final String accId;
  const AddNewAccountView({Key? key, this.isEdit = false, this.accId = ""}) : super(key: key);

  @override
  State<AddNewAccountView> createState() => _AddNewAccountViewState();
}

class _AddNewAccountViewState extends State<AddNewAccountView> {

  String selectAccType = "";
  Sector? selectIndustry;
  Sector? selectTypeOfSubSector;
  String selectedTypeOfAddress = "";
  UserLoginData? selectedAccOwner;

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
  File? accLogo;
  // List<CountryState> arrayList = [];
  List<Address> addresses = [];
  Address? editableAddress;
  PhoneNumber? mobileNo;
  PhoneNumber? phoneNo;
  PhoneNumber? extensionNo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSave = false;

  @override
  void initState() {
    makeAPICalls();
    super.initState();
  }

  makeAPICalls(){
    AccountController.to.getSectorAPI(callback: (){
      AccountController.to.getAccountOwnerAPI(callback: (){
        if(widget.isEdit){
          getAccDetail();
        }
      });
    });
  }

  getAccDetail(){
    AccountController.to.getAccountDetail(accId: widget.accId,callback: (){
      var res = AccountController.to.accountDetail.value.data;
      accNameController.text = res?.name ?? "";
      parentAccController.text = res?.parentAccount ?? "";
      selectAccType = res?.accountType ?? "";
      accSiteController.text = res?.accountSite ?? "";
      emailController.text = res?.email ?? "";
      websiteController.text = res?.website ?? "";
      faxController.text = res?.fax ?? "";
      descController.text = res?.description ?? "";
      selectedAccOwner = UserLoginData(
          id: res?.accountOwner,
          name: res?.accountOwnerName ?? ""
      );
      selectIndustry = Sector(
          id: int.parse(res!.sector!),
          name: res.sectorName
      );
      selectTypeOfSubSector = Sector(
          id: res.subSector ?? 0,
          name: res.subsectorName
      );
      addresses.addAll(AccountController.to.accountDetail.value.addresses ?? []);
      setState(() {});
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

  bool checkAppValidation(){
    if(selectAccType.isNotEmpty){
      if(selectIndustry != null){
        if(selectTypeOfSubSector != null){
          if(_formKey.currentState!.validate()){
            _formKey.currentState!.save();
            return true;
          }else{
            // showSnackBar(title: ApiConfig.error, message: "Enter account name");
          }
        }else{
          // showSnackBar(title: ApiConfig.error, message: "Select sub sector");
        }
      }else{
        // showSnackBar(title: ApiConfig.error, message: "Select Industry");
      }
    }else{
      // showSnackBar(title: ApiConfig.error, message: "Select account type");
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(context: context,
        appBar: commonAppbar(context: context,title: "Add Account",
            centerTitle: true,
            isLeadingCCustom: true,
            leadingWidget: InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined,color: blackColor))
        ),
        bottomNavigation: ColoredBox(
          color: textBgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8.0),
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
                        title: "Save",
                        height: 50,
                        tapOnButton: () {
                          setState(() {
                            isSave = true;
                          });
                          if(checkAppValidation()){
                            AccountController.to.addEditAccountView(
                                isEdit: widget.isEdit,
                                companyId: widget.isEdit ? widget.accId : "0",
                                attachment: accLogo,
                                accName: accNameController.text,
                                accOwner: selectedAccOwner?.id,
                                accType: selectAccType,
                                desc: descController.text,
                                editCompanyName: widget.isEdit ? "" : "",
                                email: emailController.text,
                                extension: extensionNo?.number ?? "",
                                eDialCode: extensionNo?.countryISOCode.toLowerCase() ?? "",
                                eCountryCode: extensionNo?.countryCode.replaceAll("+", "") ?? "",
                                mobile: mobileNo?.number ?? "",
                                mDialCode: mobileNo?.countryISOCode.toLowerCase() ?? "",
                                mCountryCode: mobileNo?.countryCode.replaceAll("+", "") ?? "",
                                parentAcc: parentAccController.text,
                                fax: faxController.text,
                                phone: phoneNo?.number ?? "",
                                pDialCode: phoneNo?.countryISOCode.toLowerCase() ?? "",
                                pCountryCode: phoneNo?.countryCode.replaceAll("+", "") ?? "",
                                website: websiteController.text,
                                sector: selectIndustry?.id,
                                subSector: selectTypeOfSubSector?.id,
                                callback: (){
                                  Get.back();
                                  AccountController.to.getAccountOwnerAPI(callback: (){});
                                }
                            );
                          }
                        },
                        isLoading: false)
                    )
                  ],
                )
            ),
          ),
        ),
        child: ColoredBox(
          color: secondaryColor,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
            children: [
              commonHeaderTitle(title: "Account Type", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(title: "Account Type *", isChangeColor: true, color: subFontColor, fontSize: 1.1,fontWeight: 2),
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
                    bottom: 10,
                    title: selectAccType == "" ? "Account Type" : selectAccType,
                    isChangeColor: selectAccType == "" ? true : false
                ),
              ),
              if(selectAccType.isEmpty && isSave)
                commonHeaderTitle(title: "Select account type", isChangeColor: true, color: dangerColor, fontSize: 0.8,fontWeight: 1),
              commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(title: "Industry *", isChangeColor: true, color: subFontColor, fontSize: 1.1,fontWeight: 2),
              commonVerticalSpacing(spacing: 8),
              InkWell(
                onTap: (){
                  commonBottomView(context: context,
                      child: SectorBottomView(
                        myItems: AccountController.to.sectorList,
                        selectionCallBack: (
                            Sector val) {
                          setState(() {
                            selectIndustry = val;
                          });
                          AccountController.to.getSubSectorAPI({"sector": selectIndustry?.id ?? ""},callback: (){});
                        }, title: 'Select Industry *',
                      )
                  );
                },
                child: commonDecoratedTextView(
                  bottom: 10,
                    title: selectIndustry == null ? "Select Industry" : selectIndustry!.name ?? "",
                    isChangeColor: selectIndustry == null ? true : false
                ),
              ),
              if(selectIndustry == null && isSave)
                commonHeaderTitle(title: "Select industry", isChangeColor: true, color: dangerColor, fontSize: 0.8,fontWeight: 1),
              commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(title: "Type of Sub Sectors *", isChangeColor: true, color: subFontColor, fontSize: 1.1,fontWeight: 2),
              commonVerticalSpacing(spacing: 8),
              InkWell(
                onTap: (){
                  commonBottomView(context: context,
                      child: SectorBottomView(
                          title: "Type of Sub Sectors *",
                          myItems: AccountController.to.subSectorList,
                          selectionCallBack: (
                              Sector val) {
                            setState(() {
                              selectTypeOfSubSector = val;
                            });
                          }
                      )
                  );
                },
                child: commonDecoratedTextView(
                    bottom: 10,
                    title: selectTypeOfSubSector == null ? "Type of Sub Sectors" : selectTypeOfSubSector!.name ?? "",
                    isChangeColor: selectTypeOfSubSector == null ? true : false
                ),
              ),
              if(selectTypeOfSubSector == null && isSave)
                commonHeaderTitle(title: "Select sub sector", isChangeColor: true, color: dangerColor, fontSize: 0.8,fontWeight: 1),
              commonVerticalSpacing(spacing: 40),

              commonHeaderTitle(title: "Account Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(),
              Form(
                key: _formKey,
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
                              ? "Enter account name"
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
                          // return value.toString().isEmpty
                          //     ? notEmptyFieldMessage
                          //     : null;
                        }),
                    commonVerticalSpacing(spacing: 20),
                  ],
                ),
              ),
              commonVerticalSpacing(spacing: 40),

              StatefulBuilder(builder: (context, newSetState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(title: "Address Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
                        if(addresses.isNotEmpty)
                          InkWell(
                            onTap: (){
                              newSetState(() {
                                selectedTypeOfAddress = "";
                                accSiteController.text = "";
                                addressController.text = "";
                                selectedPinCode = null;
                                pinCodeController.text = "";
                                cityController.text = "";
                                stateController.text = "";
                                countryController.text = "";
                                editableAddress = null;
                              });
                            },
                            child: const Icon(Icons.add_circle_outlined, color: ourBlueColor,size: 40,),
                        )
                      ],
                    ),
                    commonVerticalSpacing(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: neurmorphicBoxDecoration,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  commonHeaderTitle(title: addresses[index].addressType ?? "",
                                      fontSize: 1,fontWeight: 2),
                                  commonHeaderTitle(title: addresses[index].accountSite ?? "",
                                      fontSize: 1,fontWeight: 0)
                                ],
                              ),
                              commonVerticalSpacing(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: commonHeaderTitle(title: '${addresses[index].address}, ${addresses[index].city} ${addresses[index].state}, ${addresses[index].country}, ${addresses[index].pincodeValue}',
                                      fontSize: 1)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          newSetState(() {
                                            editableAddress = addresses[index];
                                            selectedTypeOfAddress = editableAddress?.addressType ?? "";
                                            accSiteController.text = editableAddress?.accountSite ?? "";
                                            addressController.text = editableAddress?.address ?? "";
                                            selectedPinCode = CountryState(
                                              cityName: editableAddress?.city,
                                              stateName: editableAddress?.state,
                                              countryName: editableAddress?.country,
                                              id: editableAddress?.id,
                                              name: editableAddress?.pincodeValue,
                                              pinCode: editableAddress?.pincodeValue,
                                              cityId: editableAddress?.cityId,
                                              stateId: editableAddress?.stateId,
                                              countryId: editableAddress?.countryId
                                            );
                                            pinCodeController.text = selectedPinCode?.pinCode == "" ? selectedPinCode?.name ?? "" : selectedPinCode?.pinCode ?? "";
                                            cityController.text = selectedPinCode?.cityName ?? "";
                                            stateController.text = selectedPinCode?.stateName ?? "";
                                            countryController.text = selectedPinCode?.countryName ?? "";
                                          });
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: ourBlueColor
                                            ),
                                            child: const Icon(Icons.edit,color: whiteColor,size: 20,)),
                                      ),
                                      commonHorizontalSpacing(),
                                      InkWell(
                                        onTap: (){
                                          AddressController.to.deleteAddress(addressId: addresses[index].id.toString(),callback: (){
                                            AccountController.to.getAccountDetail(accId: widget.accId.toString(),callback: (){
                                              addresses.addAll(AccountController.to.accountDetail.value.addresses ?? []);
                                              newSetState((){});
                                            });
                                          });
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: dangerColor
                                            ),
                                            child: const Icon(Icons.delete_outline,color: whiteColor,size: 20,)),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },),
                    commonVerticalSpacing(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonHeaderTitle(title: "Type of Address", isChangeColor: true, color: subFontColor, fontSize: 1.1,fontWeight: 2,align: TextAlign.start),
                      ],
                    ),
                    commonVerticalSpacing(spacing: 8),
                    InkWell(
                      onTap: (){
                        commonBottomView(context: context,
                            child: CommonBottomStringView(
                                hintText: "Type of Address",
                                myItems: const ["Corporate Office","Registered Office","Branch Office","Plant/Factory","Other"],
                                selectionCallBack: (
                                    String val) {
                                  newSetState(() {
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
                          // return value.toString().isEmpty
                          //     ? notEmptyFieldMessage
                          //     : null;
                        }),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "Address",
                        hintText: "Address",
                        textEditingController: addressController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          // return value.toString().isEmpty
                          //     ? notEmptyFieldMessage
                          //     : null;
                        }),
                    commonVerticalSpacing(spacing: 20),
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: neuMorphicWidget(
                              margin: 0,
                              child: TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                  autofocus: false,
                                  controller: pinCodeController,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: textBgColor,
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
                                    cityController.text = selectedPinCode?.cityName ?? "";
                                    stateController.text = selectedPinCode?.stateName ?? "";
                                    countryController.text = selectedPinCode?.countryName ?? "";
                                  });
                                },
                                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  elevation: 8.0,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                            ),
                          ),
                          commonHorizontalSpacing(spacing: 15),
                          commonFillButtonView(
                              context: context,
                              title: "New PinCode",
                              color: textBgColor,
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
                        isEnabled: false,
                        textEditingController: cityController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          // return value.toString().isEmpty
                          //     ? notEmptyFieldMessage
                          //     : null;
                        }),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "State",
                        hintText: "State",
                        isEnabled: false,
                        textEditingController: stateController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          // return value.toString().isEmpty
                          //     ? notEmptyFieldMessage
                          //     : null;
                        }),
                    commonVerticalSpacing(spacing: 15),
                    CommonTextFiled(
                        fieldTitleText: "Country",
                        hintText: "Country",
                        isEnabled: false,
                        textEditingController: countryController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          // return value.toString().isEmpty
                          //     ? notEmptyFieldMessage
                          //     : null;
                        }),
                    commonVerticalSpacing(spacing: 20),
                    commonFillButtonView(context: context, height: 40,width: 120, title: "Save", tapOnButton: (){
                      AddressController.to.addEditAddressAPI(
                        isEdit: editableAddress != null ? true : false,
                        companyId: editableAddress != null ? widget.accId.toString() : "0",
                        addId: editableAddress != null ? (editableAddress?.id).toString() : "",
                        pinCode: selectedPinCode?.id ?? "",
                        accSite: accSiteController.text,
                        address: addressController.text,
                        addressType: selectedTypeOfAddress,
                        cityId: cityController.text,
                        stateId: stateController.text,
                        countryId: countryController.text,
                        callback: (int addressId){
                          if(editableAddress != null) {
                            AccountController.to.getAccountDetail(
                                accId: widget.accId.toString(),
                                callback: () {
                                  addresses.addAll(
                                      AccountController.to.accountDetail
                                          .value.addresses ?? []);
                                  newSetState(() {});
                                });
                          }else{
                            newSetState((){
                              addresses.add(Address(
                                  id: addressId,
                                  country: countryController.text,
                                  state: stateController.text,
                                  city: cityController.text,
                                  address: addressController.text,
                                  addressType: selectedTypeOfAddress,
                                  accountSite: accSiteController.text,
                                  pincodeValue: selectedPinCode?.name,
                                  pincode: selectedPinCode?.id?.toInt()
                              ));
                            });
                          }
                        }
                      );
                    }, isLoading: false),
                    commonVerticalSpacing(spacing: 40),
                  ],
                );
              },),
              commonHeaderTitle(title: "Contact Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(),
              CommonTextFiled(
                  fieldTitleText: "Email Address * ",
                  hintText: "Email Address * ",
                  textEditingController: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    // return value.toString().isEmpty
                    //     ? notEmptyFieldMessage
                    //     : null;
                  }),

              commonVerticalSpacing(spacing: 15),
              neuMorphicWidget(
                margin: 0,
                child: IntlPhoneField(
                  initialCountryCode: "IN",
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mobile No",
                      fillColor: textBgColor,
                      filled: true,
                      hintStyle: white14PxNormal.copyWith(
                          color: subFontColor,fontSize: isTablet() ? 19 : 16),
                      contentPadding: const EdgeInsets.only(bottom: 1),
                      counterText: ""
                  ),
                  onChanged: (PhoneNumber phone) {
                    mobileNo = phone;
                  },
                  onCountryChanged: (country) {
                    if (kDebugMode) {
                      print('Mobile No changed to: ${country.name}');
                    }
                  },
                ),
              ),
              commonVerticalSpacing(spacing: 15),
              neuMorphicWidget(
                margin: 0,
                child: IntlPhoneField(
                  initialCountryCode: "IN",
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone No",
                      fillColor: textBgColor,
                      filled: true,
                      hintStyle: white14PxNormal.copyWith(
                          color: subFontColor,fontSize: isTablet() ? 19 : 16),
                      contentPadding: const EdgeInsets.only(bottom: 1),
                      counterText: ""
                  ),
                  onChanged: (phone) {
                    phoneNo = phone;
                  },
                  onCountryChanged: (country) {
                    if (kDebugMode) {
                      print('Phone No changed to: ${country.name}');
                    }
                  },
                ),
              ),
              commonVerticalSpacing(spacing: 15),
              neuMorphicWidget(
                margin: 0,
                child: IntlPhoneField(
                  initialCountryCode: "IN",
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Extension No",
                      fillColor: textBgColor,
                      filled: true,
                      hintStyle: white14PxNormal.copyWith(
                          color: subFontColor,fontSize: isTablet() ? 19 : 16),
                      contentPadding: const EdgeInsets.only(bottom: 1),
                      counterText: ""
                  ),
                  onChanged: (phone) {
                    extensionNo = phone;
                  },
                  onCountryChanged: (country) {
                    if (kDebugMode) {
                      print('Extension No changed to: ${country.name}');
                    }
                  },
                ),
              ),
              commonVerticalSpacing(spacing: 15),
              CommonTextFiled(
                  fieldTitleText: "Website",
                  hintText: "Website",
                  textEditingController: websiteController,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    // return value.toString().isEmpty
                    //     ? notEmptyFieldMessage
                    //     : null;
                  }),
              commonVerticalSpacing(spacing: 15),
              CommonTextFiled(
                  fieldTitleText: "Fax",
                  hintText: "Fax",
                  textEditingController: faxController,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    // return value.toString().isEmpty
                    //     ? notEmptyFieldMessage
                    //     : null;
                  }),
              commonVerticalSpacing(spacing: 40),
              commonHeaderTitle(title: "Other Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(),
              CommonTextFiled(
                  fieldTitleText: "Description",
                  hintText: "Description",
                  textEditingController: descController,
                  maxLine: 6,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    // return value.toString().isEmpty
                    //     ? notEmptyFieldMessage
                    //     : null;
                  }
              ),
              commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(title: "Profile Photo", isChangeColor: true, color: subFontColor, fontSize: 1.1,fontWeight: 2),
              commonVerticalSpacing(spacing: 15),
              accLogo == null ? neuMorphicWidget(
                margin: 0,
                child: InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    try {
                      final XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      setState(() {
                        accLogo = (File(pickedFile!.path));
                      });
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    width: getScreenWidth(context),
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.photo_camera_back_outlined,size: 30),
                        commonVerticalSpacing(),
                        commonHeaderTitle(title: "Select Image", isChangeColor: true, color: blackColor, fontSize: 1.2,fontWeight: 2),
                        commonVerticalSpacing(),
                        commonHeaderTitle(title: "Supports JPG,PNG,JPEG", isChangeColor: true, color: greyColor, fontSize: 1.0,fontWeight: 2),
                      ],
                    ),
                  ),
                ),
              ) : SizedBox(
                width: getScreenWidth(context),
                height: 100,
                child: Image.file(accLogo!),
              ),
              commonVerticalSpacing(spacing: 40),
              commonHeaderTitle(title: "Contact Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(spacing: 15),
              commonHeaderTitle(title: "Account Owner *", isChangeColor: true, color: subFontColor, fontSize: 1.1,fontWeight: 2),
              commonVerticalSpacing(spacing: 8),
              InkWell(
                onTap: (){
                  commonBottomView(context: context,
                      child: OwnerBottomView(
                          title: "Account Owner",
                          myItems: AccountController.to.ownerList,
                          selectionCallBack: (
                              UserLoginData val) {
                            setState(() {
                              selectedAccOwner = val;
                            });
                          })
                  );
                },
                child: commonDecoratedTextView(
                    bottom: 10,
                    title: selectedAccOwner == null ? "Account Owner" : selectedAccOwner!.name ?? "",
                    isChangeColor: selectedAccOwner == null ? true : false
                ),
              ),
              // commonVerticalSpacing(spacing: 20),
            ],
          ),
        )
    );
  }
}
