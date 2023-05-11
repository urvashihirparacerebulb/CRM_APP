import 'dart:convert';
import 'package:crm_app/model/address_model.dart';
import 'package:crm_app/model/boolean_response_model.dart';
import 'package:get/get.dart';

import '../common_widgets/common_methods.dart';
import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import 'package:dio/dio.dart' as dio;
import '../utility/common_methods.dart';
import 'general_controller.dart';

class AddressController extends GetxController {
  static AddressController get to => Get.find();

  // RxList<CountryState> pinCodesList = RxList<CountryState>();
  RxList<CountryState> countriesList = RxList<CountryState>();
  RxList<CountryState> statesList = RxList<CountryState>();
  RxList<CountryState> citiesList = RxList<CountryState>();

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

  void deleteAddress({String? addressId, Function? callback}) {
    apiServiceCall(
        params: {
          "address_id": addressId
        },
        serviceUrl: ApiConfig.deleteAddressURL,
        success: (dio.Response<dynamic> response) {
          BooleanResponseModel booleanResponseModel = BooleanResponseModel.fromJson(jsonDecode(response.data));
          showSnackBar(title: ApiConfig.success,message: booleanResponseModel.message ?? "");
          callback!();
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

  addEditAddressAPI({bool isEdit = false, String addId = "",companyId, addressType,address,pinCode,accSite,cityId,stateId,countryId,
    Function? callback
  }){
    dio.FormData formData = dio.FormData.fromMap({
      "company_id": companyId,
      "address_type": addressType,
      "address": address,
      "pincode": pinCode,
      "account_site": accSite,
      "city": cityId,
      "state": stateId,
      "country": countryId
    });
    if(isEdit){
      formData.fields.add(MapEntry("addressid", addId));
    }
    apiServiceCall(
        params: {},
        formValues: formData,
        serviceUrl: ApiConfig.addEditAddressURL,
        success: (dio.Response<dynamic> response) {
          BooleanResponseModel booleanResponseModel = BooleanResponseModel.fromJson(jsonDecode(response.data));
          showSnackBar(title: ApiConfig.success,message: booleanResponseModel.message ?? "");
          callback!((jsonDecode(response.data))["data"]);
        },
        error: (dio.Response<dynamic> response) {
          errorHandling(response);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodPOST
    );
  }

}
