import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import '../model/address_model.dart';
import '../model/contact_response_model.dart';
import 'package:dio/dio.dart' as dio;

import '../utility/common_methods.dart';
import 'general_controller.dart';

class ContactController extends GetxController {
  static ContactController get to => Get.find(); // add this
  RxList<ContactList> contactList = RxList<ContactList>();
  RxList<AddressResponse> companyAddressList = RxList<AddressResponse>();
  Rx<ContactDetail> contactDetail = ContactDetail().obs;

  void getContactListAPI() {
    apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.contactListURL,
      success: (dio.Response<dynamic> response) {
        ContactListResponseModel contactListResponseModel = ContactListResponseModel.fromJson(jsonDecode(response.data));
        contactList.addAll(contactListResponseModel.data ?? []);
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void getCompanyAddresses({Function? callback,String? companyID}) {
    apiServiceCall(
      params: {
        "company_id": companyID
      },
      serviceUrl: ApiConfig.getCompanyAddressesURL,
      success: (dio.Response<dynamic> response) {
        AddressListResponse addressListResponse = AddressListResponse.fromJson(jsonDecode(response.data));
        companyAddressList.addAll(addressListResponse.data ?? []);
        callback!();
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void getContactDetail({Function? callback,String? contactId}) {
    apiServiceCall(
      params: {
        "contact_id": contactId
      },
      serviceUrl: ApiConfig.getContactDetailURL,
      success: (dio.Response<dynamic> response) {
        ContactDetailResponseModel contactDetailResponseModel = ContactDetailResponseModel.fromJson(jsonDecode(response.data));
        contactDetail.value = contactDetailResponseModel.data!;
        callback!();
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  Future<void> addEditContactView({String title = "",firstName,lastName,designation,companyId,department,
    reportingTo, moNo,phNo,exNo, email,contactFax, companyAddressValue,street,cityName,cityId,
    stateName,stateId,countryName,countryId,perNo,perEmail,desc, dialCode,countryCode,
    phoneDialCode,phoneCountryCode, exDialCode, exCountryCode, perDialCode,perCountryCode,
    bool isEdit = false,
    String contactId = "",
    File? attachment,
    Function? callback}) async {
    dio.FormData formData = dio.FormData.fromMap({
      "title": title,
      "first_name": firstName,
      "last_name": lastName,
      "designation": designation,
      "company_id": companyId,
      "department": department,
      "reporting_to": reportingTo,
      "mobile_no": moNo,
      "phone_no": phNo,
      "extention_no": exNo,
      "email": email,
      "contact_fax": contactFax,
      "contact_company_address_value": companyAddressValue,
      "mailing_street": street,
      "mailing_city_name": cityName,
      "mailing_city": cityId,
      "mailing_state_name": stateName,
      "mailing_state": stateId,
      "mailing_country_name": countryName,
      "mailing_country": countryId,
      "personal_number": perNo,
      "personal_email": perEmail,
      "description": desc,
      "dial_code": dialCode,
      "country_code": countryCode,
      "phone_dial_code": phoneDialCode,
      "phone_country_code": phoneCountryCode,
      "extention_dial_code": exDialCode,
      "extention_country_code": exCountryCode,
      "personal_dial_code": perDialCode,
      "personal_country_code": perCountryCode,
      "user_id": getLoginData()!.data?.userlogindata?.id
    });

    if(isEdit){
      formData.fields.add(MapEntry("contacts_id", contactId));
    }

    if(attachment != null){
      formData.files.add(
        MapEntry("profile_image_name", await dio
            .MultipartFile.fromFile(attachment.path)),);
    }

    apiServiceCall(
        params: {},
        formValues: formData,
        serviceUrl: ApiConfig.addEditContactURL,
        success: (dio.Response<dynamic> response) {
          // BooleanResponseModel booleanResponseModel = BooleanResponseModel.fromJson(jsonDecode(response.data));
          callback!();
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

}