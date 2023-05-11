import 'dart:convert';

import 'package:get/get.dart';

import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import 'package:dio/dio.dart' as dio;

import '../model/lead_response_model.dart';
import 'general_controller.dart';

class LeadController extends GetxController {
  static LeadController get to => Get.find(); // add this
  RxList<Lead> leadList = RxList<Lead>();

  void getLeadListAPI() {
    apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.leadListURL,
      success: (dio.Response<dynamic> response) {
        LeadListResponseModel leadListResponseModel = LeadListResponseModel.fromJson(jsonDecode(response.data));
        leadList.addAll(leadListResponseModel.data ?? []);
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }
}