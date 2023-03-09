import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottom_view/common_bottom_string_view.dart';
import '../../common_widgets/common_product_textfield.dart';
import '../../common_widgets/common_textfield.dart';
import '../../common_widgets/common_widgets_view.dart';
import '../../utility/color_utility.dart';
import '../../utility/constants.dart';

class AddNewDealView extends StatefulWidget {
  const AddNewDealView({Key? key}) : super(key: key);

  @override
  State<AddNewDealView> createState() => _AddNewDealViewState();
}

class _AddNewDealViewState extends State<AddNewDealView> {

  String selectedDealOwner = "";
  String selectedCompany = "";
  String selectedContactName = "";
  String selectedStage = "";
  String selectedDealSource = "";
  TextEditingController dealNameController = TextEditingController();
  TextEditingController dealStartDateController = TextEditingController();
  TextEditingController estimatedDealDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dealValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      appBar: commonAppbar(context: context,title: "Add Deal",
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
            commonHeaderTitle(title: "Deal Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
            commonVerticalSpacing(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              decoration: neurmorphicBoxDecoration,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonHeaderTitle(title: "Deal Owner", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Lead Owner",
                              myItems: const ["JAY DARJI","HITESH PATEL"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedDealOwner = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                      bottom: 10,
                        title: selectedDealOwner == "" ? "Deal Owner" : selectedDealOwner,
                        isChangeColor: selectedDealOwner == "" ? true : false
                    ),
                  ),

                  CommonTextFiled(
                      fieldTitleText: "Deal Name * ",
                      hintText: "Deal Name * ",
                      textEditingController: dealNameController,
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }),
                  commonVerticalSpacing(spacing: 20),
                  commonHeaderTitle(title: "Company *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Company *",
                              myItems: const ["abc test","sdvfsdg"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedCompany = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedCompany == "" ? "Company *" : selectedCompany,
                        isChangeColor: selectedCompany == "" ? true : false
                    ),
                  ),

                  commonHeaderTitle(title: "Contact Name *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Contact Name *",
                              myItems: const ["advdfbc test","sdvfsdg", "dvdfd","DFSDfs"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedContactName = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedContactName == "" ? "Title *" : selectedContactName,
                        isChangeColor: selectedContactName == "" ? true : false
                    ),
                  ),
                  commonHeaderTitle(title: "Stage *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Stage *",
                              myItems: const ["advdfbc test","sdvfsdg", "dvdfd","DFSDfs"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedStage = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedStage == "" ? "Stage *" : selectedStage,
                        isChangeColor: selectedStage == "" ? true : false
                    ),
                  ),
                  commonHeaderTitle(title: "Deal Source *", isChangeColor: true, color: blackColor, fontSize: 1.0,fontWeight: 2),
                  commonVerticalSpacing(spacing: 8),
                  InkWell(
                    onTap: (){
                      commonBottomView(context: context,
                          child: CommonBottomStringView(
                              hintText: "Deal Source *",
                              myItems: const ["advdfbc test","sdvfsdg", "dvdfd","DFSDfs"],
                              selectionCallBack: (
                                  String val) {
                                setState(() {
                                  selectedDealSource = val;
                                });
                              }));
                    },
                    child: commonDecoratedTextView(
                        title: selectedDealSource == "" ? "Deal Source *" : selectedDealSource,
                        isChangeColor: selectedDealSource == "" ? true : false
                    ),
                  ),
                  CommonTextFiled(
                      fieldTitleText: "Deal Start Date *",
                      hintText: "Deal Start Date *",
                      textEditingController: dealStartDateController,
                      onChangedFunction: (String value){
                      },
                      validationFunction: (String value) {
                        return value.toString().isEmpty
                            ? notEmptyFieldMessage
                            : null;
                      }),
                  commonVerticalSpacing(spacing: 15),
                  CommonTextFiled(
                      fieldTitleText: "Estimated Deal Date",
                      hintText: "Estimated Deal Date",
                      textEditingController: estimatedDealDateController,
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

            commonVerticalSpacing(spacing: 30),
            commonHeaderTitle(title: "Other Information", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
            commonVerticalSpacing(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              decoration: neurmorphicBoxDecoration,
              child: CommonTextFiled(
                  fieldTitleText: "Description",
                  hintText: "Description",
                  textEditingController: descriptionController,
                  onChangedFunction: (String value){
                  },
                  validationFunction: (String value) {
                    return value.toString().isEmpty
                        ? notEmptyFieldMessage
                        : null;
                  }),
            ),

            commonVerticalSpacing(spacing: 30),
            commonHeaderTitle(title: "Associated Products", isChangeColor: true, color: blackColor, fontSize: 1.5,fontWeight: 2),
            commonVerticalSpacing(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              decoration: neurmorphicBoxDecoration,
              child: Column(
                children: [
                  const MyTableWidget(),
                  commonVerticalSpacing(spacing: 20),
                  Row(
                    children: [
                      Expanded(flex: 2,child: Container(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade200
                          ),
                          child: commonHeaderTitle(
                              isChangeColor: true,
                              color: ourBlueColor,
                              fontWeight: 2,
                              fontSize: 1.3,title: "+ Products"
                          )
                      )),
                      commonHorizontalSpacing(spacing: 30),
                      Expanded(flex: 3,child: CommonTextFiled(
                          fieldTitleText: "Deal Value * ",
                          hintText: "Deal Value * ",
                          textEditingController: dealValueController,
                          onChangedFunction: (String value){
                          },
                          validationFunction: (String value) {
                            return value.toString().isEmpty
                                ? notEmptyFieldMessage
                                : null;
                          }))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MyTableWidget extends StatefulWidget {
  const MyTableWidget({super.key});

  @override
  _MyTableWidgetState createState() => _MyTableWidgetState();
}

class _MyTableWidgetState extends State<MyTableWidget> {
  final List<DataRow> _rows = [];

  @override
  void initState() {
    super.initState();

    // initialize the rows with empty text fields
    for (int i = 0; i < 5; i++) {
      _rows.add(DataRow(
        cells: [
          DataCell(CommonDropdownView(listData: const ["aaaaa","sssss","ddddd"],selectedVal: "sssss",changeCallback: (){},)),
          DataCell(CommonDropdownView(listData: const ["aaaaaaa","sssssaa","dddddaa"],selectedVal: "sssssaa",changeCallback: (){},)),
          DataCell(CommonProductTextField(
            selectionCallBack: (String val){},
            fieldHeader: "",
            selectedVal: "",
          )),
          DataCell(CommonProductTextField(
            selectionCallBack: (String val){},
            fieldHeader: "",
            selectedVal: "",
          )),
          DataCell(CommonProductTextField(
            selectionCallBack: (String val){},
            fieldHeader: "",
            selectedVal: "",
          )),
          DataCell(CommonProductTextField(
            selectionCallBack: (String val){},
            fieldHeader: "",
            selectedVal: "",
          )), DataCell(InkWell(
            onTap: (){},
            child: const Icon(Icons.close,color: dangerColor),
          )),
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: commonHeaderTitle(title: "Category",fontSize: 1.2,fontWeight: 2)),
          DataColumn(label: commonHeaderTitle(title: "Product",fontSize: 1.2,fontWeight: 2)),
          DataColumn(label: commonHeaderTitle(title: "List Price(₹)",fontSize: 1.2,fontWeight: 2)),
          DataColumn(label: commonHeaderTitle(title: "Quantity",fontSize: 1.2,fontWeight: 2)),
          DataColumn(label: commonHeaderTitle(title: "Discount(%)(₹)",fontSize: 1.2,fontWeight: 2)),
          DataColumn(label: commonHeaderTitle(title: "Total(₹)",fontSize: 1.2,fontWeight: 2)),
          DataColumn(label: commonHeaderTitle(title: "",fontSize: 1.2,fontWeight: 2)),
        ],
        rows: _rows,
      ),
    );
  }
}
