import 'dart:convert';
import 'dart:io';

import 'package:crm_app/model/login_response_model.dart';
import 'package:crm_app/utility/common_methods.dart';
import 'package:get/get.dart';

import '../common_widgets/common_methods.dart';
import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import '../model/account_response_model.dart';
import 'package:dio/dio.dart' as dio;

import '../model/boolean_response_model.dart';
import 'general_controller.dart';

class AccountController extends GetxController {
  static AccountController get to => Get.find(); // add this
  RxList<UserLoginData> ownerList = RxList<UserLoginData>();
  RxList<Sector> sectorList = RxList<Sector>();
  RxList<Sector> subSectorList = RxList<Sector>();
  Rx<AccountListResponse> accountDetail = AccountListResponse().obs;
  RxList<Address> addressList = RxList<Address>();
  RxList<AccountList> accountLists = RxList<AccountList>();
  RxBool isAccInfoExpanded = true.obs;
  RxBool isAddressExpanded = false.obs;
  RxBool isContactExpanded = false.obs;
  RxBool isNotesExpanded = false.obs;
  RxBool isActivitiesExpanded = false.obs;
  RxBool isDealsExpanded = false.obs;

  void getAccountOwnerAPI({Function? callback}) {
    ownerList.clear();
    apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.accOwnerURL,
      success: (dio.Response<dynamic> response) {
        AccountOwnerResponseModel accountOwnerResponseModel = AccountOwnerResponseModel.fromJson(jsonDecode(response.data));
        ownerList.addAll(accountOwnerResponseModel.data ?? []);
        callback!();
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void getSectorAPI({Function? callback}) {
    sectorList.clear();
    apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.sectorURL,
      success: (dio.Response<dynamic> response) {
        SectorResponseModel sectorResponseModel = SectorResponseModel.fromJson(jsonDecode(response.data));
        sectorList.addAll(sectorResponseModel.data ?? []);
        callback!();
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void getSubSectorAPI(Map<String, dynamic> params,{Function? callback}) {
    subSectorList.clear();
    apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.subSectorURL,
      success: (dio.Response<dynamic> response) {
        SectorResponseModel sectorResponseModel = SectorResponseModel.fromJson(jsonDecode(response.data));
        subSectorList.addAll(sectorResponseModel.data ?? []);
        callback!();
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void getAccountDetail({String? accId, Function? callback}) {
    addressList.clear();
    apiServiceCall(
        params: {
          "company_id": accId
        },
        serviceUrl: ApiConfig.getAccountDetailURL,
        success: (dio.Response<dynamic> response) {
          AccountListResponseModel accountListResponseModel = AccountListResponseModel.fromJson(jsonDecode(response.data));
          accountDetail.value = accountListResponseModel.data!;
          callback!();
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

  Future<void> addEditAccountView({String accType = "",sector, subSector, accName, parentAcc, email, mobile, phone, extension, website, fax,desc, accOwner,
    String editCompanyName = "",
    String mDialCode = "",mCountryCode, pDialCode, pCountryCode,eDialCode,eCountryCode,
    bool isEdit = false,
    String companyId = "",
    File? attachment,
    Function? callback}) async {
    dio.FormData formData = dio.FormData.fromMap({
      "account_type": accType,
      "sector": sector,
      "sub_sector": subSector,
      "account_name": accName,
      "parent_account": parentAcc,
      "email": email,
      "mobile": mobile,
      "phone": phone,
      "extention": extension,
      "website": website,
      "fax": fax,
      "mobile_dial_code": mDialCode,
      "mobile_country_code": mCountryCode,
      "phone_dial_code": pDialCode,
      "phone_country_code": pCountryCode,
      "extention_dial_code": eDialCode,
      "extention_country_code": eCountryCode,
      "description": desc,
      "account_owner": accOwner,
      "company_logo_name": attachment == null ? "" : attachment.path,
      "user_id": getLoginData()!.data?.userlogindata?.id,
      "edit_company_name": editCompanyName
    });

    if(isEdit){
      formData.fields.add(MapEntry("company_id", companyId));
    }

    if(attachment != null){
      formData.files.add(
        MapEntry("company_logo", await dio
            .MultipartFile.fromFile(attachment.path)),);
    }

    apiServiceCall(
        params: {},
        formValues: formData,
        serviceUrl: ApiConfig.addEditAccountURL,
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

  void deleteAccount({String? companyId}) {
    apiServiceCall(
        params: {
          "company_id": companyId
        },
        serviceUrl: ApiConfig.deleteAccountURL,
        success: (dio.Response<dynamic> response) {
          BooleanResponseModel booleanResponseModel = BooleanResponseModel.fromJson(jsonDecode(response.data));
          showSnackBar(title: ApiConfig.success,message: booleanResponseModel.message ?? "");
          getAccountLists();
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

  void getAccountLists({Function? callback}) {
    accountLists.clear();
    apiServiceCall(
        params: {},
        serviceUrl: ApiConfig.accountListURL,
        success: (dio.Response<dynamic> response) {
          CompanyListResponse companyListResponse = CompanyListResponse.fromJson(jsonDecode(response.data));
          accountLists.addAll(companyListResponse.data ?? []);
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
