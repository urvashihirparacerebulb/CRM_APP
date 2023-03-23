import 'dart:convert';
import 'package:crm_app/model/address_model.dart';
import 'package:crm_app/model/boolean_response_model.dart';
import 'package:get/get.dart';

import '../common_widgets/common_methods.dart';
import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import 'package:dio/dio.dart' as dio;

import '../model/account_response_model.dart';
import '../utility/common_methods.dart';
import 'general_controller.dart';

class AddressController extends GetxController {
  static AddressController get to => Get.find();

  RxList<CountryState> pinCodesList = RxList<CountryState>();
  RxList<CountryState> countriesList = RxList<CountryState>();
  RxList<CountryState> statesList = RxList<CountryState>();
  RxList<CountryState> citiesList = RxList<CountryState>();
  RxList<AccountList> accountLists = RxList<AccountList>();

  // Future<List<CountryState>> getPinCodesAPI({String searchString = "",Function? callback}) async {
  //   pinCodesList.clear();
  //   apiServiceCall(
  //     params: {
  //       "searchTerm": searchString
  //     },
  //     serviceUrl: ApiConfig.pinCodesURL,
  //     success: (dio.Response<dynamic> response) {
  //       CountryStateResponseModel countryStateResponseModel = CountryStateResponseModel.fromJson(jsonDecode(response.data));
  //       pinCodesList.addAll(countryStateResponseModel.data ?? []);
  //       return pinCodesList.value;
  //     },
  //     error: (dio.Response<dynamic> response) {
  //       errorHandling(response);
  //
  //     },
  //     isProgressShow: false,
  //     methodType: ApiConfig.methodPOST,
  //   );
  // }

  void getCountriesList({Function? callback}) {
    apiServiceCall(
        params: {},
        serviceUrl: ApiConfig.fetchCountryURL,
        success: (dio.Response<dynamic> response) {
          CountryStateResponseModel countryStateResponseModel = CountryStateResponseModel.fromJson(jsonDecode(response.data));
          countriesList.addAll(countryStateResponseModel.data ?? []);
          callback!();
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

  void getStatesList({String? countryId, Function? callback}) {
    statesList.clear();
    apiServiceCall(
        params: {
          "country_id": countryId
        },
        serviceUrl: ApiConfig.fetchStateURL,
        success: (dio.Response<dynamic> response) {
          CountryStateResponseModel countryStateResponseModel = CountryStateResponseModel.fromJson(jsonDecode(response.data));
          statesList.addAll(countryStateResponseModel.data ?? []);
          callback!();
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

  void getCitiesList({String? stateId, Function? callback}) {
    citiesList.clear();
    apiServiceCall(
        params: {
          "state_id": stateId
        },
        serviceUrl: ApiConfig.fetchCityURL,
        success: (dio.Response<dynamic> response) {
          CountryStateResponseModel countryStateResponseModel = CountryStateResponseModel.fromJson(jsonDecode(response.data));
          citiesList.addAll(countryStateResponseModel.data ?? []);
          callback!();
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

  void addNewPinCode({String pinCode = "", cityId, Function? callback}) {
    apiServiceCall(
        params: {
          "pincode_no": pinCode,
          "city_id": cityId,
          "user_id": getLoginData()!.data?.userlogindata?.id
        },
        serviceUrl: ApiConfig.addNewPinCodeURL,
        success: (dio.Response<dynamic> response) {
          Get.back();
          callback!();
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

  void getAccountLists() {
    accountLists.clear();
    apiServiceCall(
        params: {},
        serviceUrl: ApiConfig.accountListURL,
        success: (dio.Response<dynamic> response) {
          AccountListResponseModel accountListResponseModel = AccountListResponseModel.fromJson(jsonDecode(response.data));
          accountLists.addAll(accountListResponseModel.data ?? []);
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
          getAccountLists();
          showSnackBar(title: ApiConfig.success,message: booleanResponseModel.message ?? "");
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }
}
