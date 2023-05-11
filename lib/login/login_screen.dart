import 'package:crm_app/utility/assets_utility.dart';
import 'package:crm_app/utility/color_utility.dart';
import 'package:crm_app/utility/screen_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../common_widgets/common_methods.dart';
import '../common_widgets/common_textfield.dart';
import '../common_widgets/common_widgets_view.dart';
import '../controllers/authentication_controller.dart';
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
  bool isRemember = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(context: context,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: SizedBox(height: getScreenHeight(context) / 1.7,
                    width: getScreenWidth(context),
                    child: Image(image: loginBgImage)
                ),
              ),
              Positioned(
                left: 0,right: 0,bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: textBgColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shrinkWrap: true,
                    children: [
                      commonVerticalSpacing(spacing: 15),
                      Image(image: appLogoImage),
                      commonHeaderTitle(title: "Welcome to CEREBULB CRM",fontSize: 1,
                          align: TextAlign.center,height: 1.3,fontWeight: 2),
                      commonVerticalSpacing(spacing: 3),
                      commonHeaderTitle(title: "Enter your Login details",
                          isChangeColor: true,color: subFontColor,
                          fontSize: 0.95,align: TextAlign.center,height: 1.3,fontWeight: 1),
                      commonVerticalSpacing(spacing: 20),
                      CommonTextFiled(
                          fieldTitleText: "Your Email",
                          hintText: "Enter Email",
                          keyboardType: TextInputType.emailAddress,
                          textEditingController: emailController,
                          onChangedFunction: (String value){
                          },
                          preFixIcon: const Icon(Icons.email_outlined),
                          validationFunction: (String value) {
                            return value.toString().isEmpty
                                ? notEmptyFieldMessage
                                : null;
                          }
                      ),
                      commonVerticalSpacing(spacing: 15),
                      CommonTextFiled(
                        fieldTitleText: "Password",
                        hintText: "Enter Password",
                        isPassword: true,
                        textEditingController: passwordController,
                        preFixIcon: const Icon(Icons.lock_open),
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }
                      ),
                      commonVerticalSpacing(spacing: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatefulBuilder(builder: (context, newSetState) => Row(
                            children: [
                              InkWell(
                                  onTap: (){
                                    newSetState((){
                                      isRemember = !isRemember;
                                      setIsRememberMe(isRemember: isRemember);
                                      if(isRemember){
                                        if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                                          setRememberedEmail(email: emailController.text);
                                          setRememberedPassword(password: passwordController.text);
                                        }
                                      }
                                    });
                                  },
                                  child: !getIsRememberMe() ? Image(image: unCheckImage,
                                      width: 20,height: 20,
                                      color: const Color(0XFFBBC3D0)
                                  ) : Icon(Icons.check_circle_outline,color: const Color(0XFFBBC3D0).withOpacity(0.9))
                              ),
                              commonHorizontalSpacing(spacing: 6),
                              commonHeaderTitle(title: reMemberMe,fontSize: 1,fontWeight: 1),
                            ],
                          )),
                          InkWell(
                            onTap: (){
                              // Get.to(() => const ForgotPasswordView());
                            },
                            child: commonHeaderTitle(title: "$forgotPassword?",fontSize: 1,fontWeight: 1),
                          )
                        ],
                      ),
                      commonVerticalSpacing(spacing: 30),
                      commonFillButtonView(context: context, title: "LogIn", color: textBgColor,tapOnButton: (){
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Map<String, dynamic> params = {
                            "username": emailController.text,
                            "password": passwordController.text,
                          };
                          AuthenticationController.to.loginAPI(params);
                        }
                      },
                          isLoading: false),
                      commonVerticalSpacing(spacing: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}