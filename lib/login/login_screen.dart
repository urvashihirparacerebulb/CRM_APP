import 'package:crm_app/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/common_textfield.dart';
import '../common_widgets/common_widgets_view.dart';
import '../utility/assets_utility.dart';
import '../utility/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(context: context,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  commonVerticalSpacing(spacing: 20),
                  Image(image: appLogoImage,height: 80),
                  commonVerticalSpacing(spacing: 20),
                  commonHeaderTitle(title: "Welcome to CEREBULB CRM",fontSize: 1.5,align: TextAlign.center,height: 1.3,fontWeight: 3),
                  commonVerticalSpacing(),
                  commonHeaderTitle(title: "Enter your details to login to your account",
                      fontSize: 1.1,align: TextAlign.center,height: 1.3,fontWeight: 1),
                  commonVerticalSpacing(spacing: 40),
                  CommonTextFiled(
                    fieldTitleText: "Email",
                    hintText: "Enter Email",
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: emailController,
                    onChangedFunction: (String value){

                    },
                    validationFunction: (String value) {
                      return value.toString().isEmpty
                          ? notEmptyFieldMessage
                          : null;
                    },),
                  commonVerticalSpacing(spacing: 25),
                  CommonTextFiled(
                    fieldTitleText: "Password",
                    hintText: "Enter Password",
                    isPassword: true,
                    textEditingController: passwordController,
                    onChangedFunction: (String value){

                    },
                    validationFunction: (String value) {
                      return value.toString().isEmpty
                          ? notEmptyFieldMessage
                          : null;
                    },),
                  commonVerticalSpacing(spacing: 25),
                  commonFillButtonView(context: context, title: "LogIn", tapOnButton: (){
                    Get.to(() => const HomeScreen());
                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    //   Map<String, dynamic> params = {
                    //     "email": emailController.text,
                    //     "password": passwordController.text,
                    //   };
                    //   AuthenticationController.to.loginAPI(params);
                    // }
                  }, isLoading: false),
                  commonVerticalSpacing(spacing: 20),
                ],
              ),
            ),
          ),
        )
    );
  }
}