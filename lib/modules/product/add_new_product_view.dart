import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';
import '../../utility/screen_utility.dart';

class AddNewProductView extends StatefulWidget {
  const AddNewProductView({Key? key}) : super(key: key);

  @override
  State<AddNewProductView> createState() => _AddNewProductViewState();
}

class _AddNewProductViewState extends State<AddNewProductView> {
  String selectedType = "";
  String selectedUnitType = "";
  TextEditingController productNameController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(context: context,
        appBar: commonAppbar(context: context,title: "Add Product",
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
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              commonHeaderTitle(title: "Product Information", isChangeColor: true,color: fontColor, fontSize: 1.6,fontWeight: 2),
              commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(title: "Type", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
              commonVerticalSpacing(spacing: 8),
              InkWell(
                onTap: (){
                  commonBottomView(context: context,
                      child: CommonBottomStringView(
                          hintText: "Type",
                          myItems: const ["HARDWARE","SOFTWARE","CRM Application"],
                          selectionCallBack: (
                              String val) {
                            setState(() {
                              selectedType = val;
                            });
                          })
                  );
                },
                child: commonDecoratedTextView(
                  bottom: 10,
                    title: selectedType == "" ? "Type" : selectedType,
                    isChangeColor: selectedType == "" ? true : false
                ),
              ),
              CommonTextFiled(
                  fieldTitleText: "Product Name *",
                  hintText: "Product Name *",
                  textEditingController: productNameController,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }),
              commonVerticalSpacing(spacing: 15),
              CommonTextFiled(
                  fieldTitleText: "Product Code",
                  hintText: "Product Code",
                  textEditingController: productCodeController,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }),
              commonVerticalSpacing(spacing: 25),
              commonHeaderTitle(title: "Unit Type", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
              commonVerticalSpacing(spacing: 8),
              InkWell(
                onTap: (){
                  commonBottomView(context: context,
                      child: CommonBottomStringView(
                          hintText: "Unit Type",
                          myItems: const ["Pieces","Ltr"],
                          selectionCallBack: (
                              String val) {
                            setState(() {
                              selectedUnitType = val;
                            });
                          }
                    )
                  );
                },
                child: commonDecoratedTextView(
                  bottom: 10,
                    title: selectedUnitType == "" ? "Unit Type" : selectedUnitType,
                    isChangeColor: selectedUnitType == "" ? true : false
                ),
              ),
              CommonTextFiled(
                  fieldTitleText: "Unit Price",
                  hintText: "Unit Price",
                  textEditingController: unitPriceController,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }
              ),
              commonVerticalSpacing(spacing: 40),
              commonHeaderTitle(title: "Other", isChangeColor: true, color: blackColor, fontSize: 1.6,fontWeight: 2),
              commonVerticalSpacing(),
              CommonTextFiled(
                  fieldTitleText: "Description",
                  hintText: "Description",
                  maxLine: 6,
                  textEditingController: descController,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }),
              commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(title: "Product Photo", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
              commonVerticalSpacing(spacing: 5),
              neuMorphicWidget(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: getScreenWidth(context),
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                  ),
                  child: Column(
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      const Icon(Icons.photo_camera_back_outlined,size: 30),
                      commonVerticalSpacing(),
                      commonHeaderTitle(title: "Select Image", isChangeColor: true, color: blackColor, fontSize: 1.2,fontWeight: 2),
                      commonVerticalSpacing(),
                      commonHeaderTitle(title: "Supports JPG,PNG,JPEG", isChangeColor: true, color: greyColor, fontSize: 1.0,fontWeight: 2),
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
