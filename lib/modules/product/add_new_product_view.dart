import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../common_widgets/common_textfield.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';

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
            leadingWidget: InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined,color: blackColor))
        ),
        child: ColoredBox(
          color: secondaryColor,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              commonHeaderTitle(title: "Product Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                decoration: neurmorphicBoxDecoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonHeaderTitle(title: "Type", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
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
                    commonHeaderTitle(title: "Unit Type", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
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
                  ],
                ),
              ),
              commonVerticalSpacing(spacing: 20),
              commonHeaderTitle(title: "Other", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
              commonVerticalSpacing(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                decoration: neurmorphicBoxDecoration,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFiled(
                        fieldTitleText: "Description",
                        hintText: "Description",
                        textEditingController: descController,
                        onChangedFunction: (String value){
                        },
                        validationFunction: (String value) {
                          return value.toString().isEmpty
                              ? notEmptyFieldMessage
                              : null;
                        }),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
