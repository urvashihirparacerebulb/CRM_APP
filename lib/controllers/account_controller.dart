import 'dart:convert';

import 'package:crm_app/model/login_response_model.dart';
import 'package:get/get.dart';

import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import '../model/account_response_model.dart';
import 'package:dio/dio.dart' as dio;

import 'general_controller.dart';

class AccountController extends GetxController {
  static AccountController get to => Get.find(); // add this
  RxList<UserLoginData> ownerList = RxList<UserLoginData>();
  RxList<Sector> sectorList = RxList<Sector>();
  RxList<Sector> subSectorList = RxList<Sector>();

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
}
