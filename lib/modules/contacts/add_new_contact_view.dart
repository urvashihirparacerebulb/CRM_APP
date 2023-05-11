import 'dart:convert';
import 'dart:io';

import 'package:crm_app/controllers/contact_controller.dart';
import 'package:crm_app/model/account_response_model.dart';
import 'package:crm_app/utility/screen_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../bottom_view/account_bottom_view.dart';
import '../../bottom_view/common_bottom_string_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../common_widgets/common_widgets_view.dart';
import '../../configurations/api_utility.dart';
import '../../configurations/config_file.dart';
import '../../controllers/account_controller.dart';
import '../../controllers/address_controller.dart';
import '../../model/address_model.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';
import '../../utility/theme_utils.dart';
import '../account/add_pincode_view.dart';

class AddContactView extends StatefulWidget {
  final bool isEdit;
  final String contactId;
  const AddContactView({Key? key, this.isEdit = false, this.contactId = ""}) : super(key: key);

  @override
  State<AddContactView> createState() => _AddContactViewState();
}

class _AddContactViewState extends State<AddContactView> {

  String selectedTitle = "";
  AccountList? selectedCompany;
  String selectedTypeOfAddress = "";
  CountryState? selectedPinCode;
  CountryState? selectedResidentialPinCode;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController reportingToController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController extensionNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController residentialAddressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController residentialPinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController residentialCityController = TextEditingController();
  TextEditingController residentialStateController = TextEditingController();
  TextEditingController residentialCountryController = TextEditingController();
  TextEditingController perMobileController = TextEditingController();
  TextEditingController perEmailController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController accSiteController = TextEditingController();

  File? profilePhoto;
  List<AddressResponse> addresses = [];
  AddressResponse? selectedAddress;
  PhoneNumber? mobileNo;
  PhoneNumber? phoneNo;
  PhoneNumber? extensionNo;
  PhoneNumber? personalMoNo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSave = false;

  @override
  void initState() {
    AccountController.to.getAccountLists(callback: (){
      if(widget.isEdit){
        fillEditedDetail();
      }
    });
    super.initState();
  }

  fillEditedDetail(){
    ContactController.to.getContactDetail(contactId: widget.contactId,callback: (){
      var detail = ContactController.to.contactDetail.value.contactData;
      selectedTitle = detail?.title ?? "";
      firstNameController.text = detail?.firstName ?? "";
      lastNameController.text = detail?.lastName ?? "";
      designationController.text = detail?.designation ?? "";
      selectedCompany = AccountController.to.accountLists.where((p0) => p0.id == detail?.companyId).toList().first;
      departmentController.text = detail?.department ?? "";
      reportingToController.text = detail?.reportingTo ?? "";
      mobileNo = PhoneNumber(countryISOCode: detail?.mobileDialCode ?? "", countryCode: detail?.mobileCountryCode ?? "", number: detail?.mobileNo ?? "");
      phoneNo = PhoneNumber(countryISOCode: detail?.phoneDialCode ?? "", countryCode: detail?.phoneCountryCode ?? "", number: detail?.phoneNo ?? "");
      extensionNo = PhoneNumber(countryISOCode: detail?.extentionDialCode ?? "", countryCode: detail?.extentionCountryCode ?? "", number: detail?.extentionNo ?? "");
      emailController.text = detail?.email ?? "";
      faxController.text = detail?.contactFax ?? "";
      addresses.addAll(ContactController.to.contactDetail.value.addressData ?? []);
      perMobileController.text = detail?.personalNumber ?? "";
      perEmailController.text = detail?.personalEmail ?? "";
      desController.text = detail?.description ?? "";
      addressController.text = detail?.mailingStreet ?? "";
      residentialPinCodeController.text = detail?.mailingCode ?? "";
      residentialCityController.text = detail?.mailingCity ?? "";
      residentialCountryController.text = detail?.mailingCountry ?? "";
      residentialStateController.text = detail?.mailingState ?? "";
      residentialAddressController.text = detail?.mailingState ?? "";
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

  bool checkContactValidation(){
    if(firstNameController.text.isNotEmpty){
      if(lastNameController.text.isNotEmpty){
        if(selectedCompany != null){
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
        appBar: commonAppbar(context: context,title: "Contact",
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
                          setState(() {
                            isSave = true;
                          });
                          if(checkContactValidation()){
                            ContactController.to.addEditContactView(
                              isEdit: widget.isEdit,
                              contactId: widget.isEdit ? widget.contactId : "0",
                              title: selectedTitle,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              designation: designationController.text,
                              companyId: selectedCompany?.id,
                              department: departmentController.text,
                              reportingTo: reportingToController.text,
                              exNo: extensionNo?.number ?? "",
                              exDialCode: extensionNo?.countryISOCode.toLowerCase() ?? "",
                              exCountryCode: extensionNo?.countryCode.replaceAll("+", "") ?? "",
                              moNo: mobileNo?.number ?? "",
                              dialCode: mobileNo?.countryISOCode.toLowerCase() ?? "",
                              countryCode: mobileNo?.countryCode.replaceAll("+", "") ?? "",
                              street: residentialAddressController.text,
                              phNo: phoneNo?.number ?? "",
                              phoneDialCode: phoneNo?.countryISOCode.toLowerCase() ?? "",
                              phoneCountryCode: phoneNo?.countryCode.replaceAll("+", "") ?? "",
                              perNo: personalMoNo?.number ?? "",
                              perDialCode: personalMoNo?.countryISOCode.toLowerCase() ?? "",
                              perCountryCode: personalMoNo?.countryCode.replaceAll("+", "") ?? "",
                              email: emailController.text,
                              perEmail: perEmailController.text,
                              contactFax: faxController.text,
                              desc: desController.text,
                              countryId: selectedResidentialPinCode?.countryId,
                              countryName: selectedResidentialPinCode?.countryName,
                              stateId: selectedResidentialPinCode?.stateId,
                              stateName: selectedResidentialPinCode?.stateName,
                              cityId: selectedResidentialPinCode?.cityId,
                              cityName: selectedResidentialPinCode?.cityName,
                              attachment: profilePhoto,
                              callback: (){
                                Get.back();
                                ContactController.to.getContactListAPI();
                              },
                              companyAddressValue: selectedAddress?.id ?? ""
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
          color: textBgColor,
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                commonHeaderTitle(title: "Contact Person", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
                commonVerticalSpacing(spacing: 20),
                commonHeaderTitle(title: "Title *", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
                      title: selectedTitle == "" ? "Title" : selectedTitle,
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
                commonHeaderTitle(title: "Company *", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
                commonVerticalSpacing(spacing: 8),
                InkWell(
                  onTap: (){
                    commonBottomView(context: context,
                        child: AccountBottomView(
                            myItems: AccountController.to.accountLists,
                            selectionCallBack: (AccountList val) {
                              setState(() {
                                selectedCompany = val;
                                ContactController.to.getCompanyAddresses(
                                  callback: (){
                                    addresses.addAll(ContactController.to.companyAddressList);
                                  },
                                  companyID: val.id.toString()
                                );
                              });
                            }, title: 'Company *',
                        )
                    );
                  },
                  child: commonDecoratedTextView(
                      bottom: 10,
                      title: selectedCompany == null ? "Company *" : selectedCompany?.name ?? "",
                      isChangeColor: selectedCompany == null ? true : false
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
                commonVerticalSpacing(spacing: 40),
                commonHeaderTitle(title: "Contact Information", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
                commonVerticalSpacing(spacing: 15),
                neuMorphicWidget(
                  margin: 0,
                  child: IntlPhoneField(
                    initialCountryCode: "IN",
                    flagsButtonPadding: const EdgeInsets.only(left: 10),
                    dropdownIconPosition: IconPosition.trailing,
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
                    flagsButtonPadding: const EdgeInsets.only(left: 10),
                    dropdownIconPosition: IconPosition.trailing,
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
                    flagsButtonPadding: const EdgeInsets.only(left: 10),
                    dropdownIconPosition: IconPosition.trailing,
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

                commonVerticalSpacing(spacing: 40),
                StatefulBuilder(builder: (context, newSetState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          commonHeaderTitle(title: "Address Information",
                              isChangeColor: true, color: blackColor,
                              fontSize: 1.5,fontWeight: 2
                          ),
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      neuMorphicWidget(
                        margin: 0,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            hint: const Text('Select'), // Not necessary for Option 1
                            value: selectedAddress,
                            onChanged: (newValue) {
                              newSetState(() {
                                selectedAddress = newValue;
                              });
                            },
                            items: addresses.map((address) {
                              return DropdownMenuItem(
                                value: address,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5.0),
                                  child: Text(address.address ?? ""),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      if(selectedAddress == null)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            commonVerticalSpacing(spacing: 20),
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
                            commonVerticalSpacing(spacing: 15),
                            SizedBox(
                              height: 55,
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
                                  isEdit: false,
                                  companyId: selectedCompany != null ? selectedCompany!.id : "0",
                                  addId: "",
                                  pinCode: selectedPinCode?.id ?? "",
                                  accSite: accSiteController.text,
                                  address: addressController.text,
                                  addressType: selectedTypeOfAddress,
                                  cityId: cityController.text,
                                  stateId: stateController.text,
                                  countryId: countryController.text,
                                  callback: (int addressId){
                                    addresses.add(AddressResponse(
                                        id: addressId,
                                        country: countryController.text,
                                        state: stateController.text,
                                        city: cityController.text,
                                        address: addressController.text,
                                        addressType: selectedTypeOfAddress,
                                        accountSite: accSiteController.text,
                                        pincodeNo: selectedPinCode?.name,
                                        pincodeId: selectedPinCode?.id?.toInt()
                                    ));
                                    ContactController.to.getCompanyAddresses(
                                        callback: (){
                                          addresses.addAll(ContactController.to.companyAddressList);
                                        },
                                        companyID: selectedCompany?.id.toString()
                                    );
                                  }
                              );
                            }, isLoading: false),
                          ],
                        ),
                    ],
                  );
                },),
                commonVerticalSpacing(spacing: 40),
                commonHeaderTitle(title: "Residential Address", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
                commonVerticalSpacing(),
                CommonTextFiled(
                  fieldTitleText: "Address",
                  hintText: "Address",
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }, textEditingController: residentialAddressController,
                ),
                commonVerticalSpacing(spacing: 20),
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: neuMorphicWidget(
                          margin: 0,
                          child: StatefulBuilder(builder: (context, newSetState) {
                            return TypeAheadField(
                              textFieldConfiguration: TextFieldConfiguration(
                                autofocus: false,
                                controller: residentialPinCodeController,
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
                                  selectedResidentialPinCode = suggestion;
                                  residentialPinCodeController.text = selectedResidentialPinCode?.pinCode ?? "0";
                                  residentialCityController.text = selectedResidentialPinCode?.cityName ?? "";
                                  residentialStateController.text = selectedResidentialPinCode?.stateName ?? "";
                                  residentialCountryController.text = selectedResidentialPinCode?.countryName ?? "";
                                });
                              },
                              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                elevation: 8.0,
                                color: Theme.of(context).cardColor,
                              ),
                            );
                          },),
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
                commonVerticalSpacing(),
                CommonTextFiled(
                  fieldTitleText: "City",
                  hintText: "City",
                  isEnabled: false,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }, textEditingController: residentialCityController,
                ),
                commonVerticalSpacing(spacing: 20),
                CommonTextFiled(
                  fieldTitleText: "State",
                  hintText: "State",
                  isEnabled: false,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }, textEditingController: residentialStateController,
                ),
                commonVerticalSpacing(spacing: 20),
                CommonTextFiled(
                  fieldTitleText: "Country",
                  hintText: "Country",
                  isEnabled: false,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }, textEditingController: residentialCountryController,
                ),
                commonVerticalSpacing(spacing: 40),
                commonHeaderTitle(title: "Personal Information", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
                commonVerticalSpacing(),
                neuMorphicWidget(
                  margin: 0,
                  child: IntlPhoneField(
                    initialCountryCode: "IN",
                    flagsButtonPadding: const EdgeInsets.only(left: 10),
                    dropdownIconPosition: IconPosition.trailing,
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
                    onChanged: (phone) {
                      personalMoNo = phone;
                    },
                    onCountryChanged: (country) {
                      if (kDebugMode) {
                        print('Extension No changed to: ${country.name}');
                      }
                    },
                  ),
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
                commonHeaderTitle(title: "Profile Photo", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
                commonVerticalSpacing(),
                profilePhoto == null ? neuMorphicWidget(
                  margin: 0,
                  child: InkWell(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      try {
                        final XFile? pickedFile = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {
                          profilePhoto = (File(pickedFile!.path));
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
                  child: widget.isEdit ? Image.network(ContactController.to.contactDetail.value.contactData?.profileImage ?? "") : Image.file(profilePhoto!),
                ),
              ],
            ),
          ),
        )
    );
  }
}
