import 'dart:convert';

import 'package:crm_app/home/home_screen.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../common_widgets/common_methods.dart';
import '../configurations/api_service.dart';
import '../configurations/config_file.dart';
import 'package:dio/dio.dart' as dio;

import '../model/login_response_model.dart';
import '../utility/common_methods.dart';
import 'general_controller.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get to => Get.find(); // add this
  final advancedDrawerController = AdvancedDrawerController().obs;

  void loginAPI(Map<String, dynamic> params) {
    apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.loginURL,
      success: (dio.Response<dynamic> response) {
        LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(jsonDecode(response.data));
        showSnackBar(title: loginResponseModel.status! ? ApiConfig.success : ApiConfig.error, message: "Login Scusessfully");
        setObject(ApiConfig.loginPref, loginResponseModel);
        setIsLogin(isLogin: true);
        Get.offAll(() => const HomeScreen());
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }
}
