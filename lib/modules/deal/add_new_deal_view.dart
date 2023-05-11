import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bottom_view/common_bottom_string_view.dart';
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
  String selectedCategory = "";
  String selectedProduct = "";
  TextEditingController dealNameController = TextEditingController();
  TextEditingController dealStartDateController = TextEditingController();
  TextEditingController estimatedDealDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryDescriptionController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController dealValueController = TextEditingController();
  TextEditingController listPriceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      appBar: commonAppbar(context: context,title: "Add Deal",
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
            commonHeaderTitle(title: "Deal Information", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
            commonVerticalSpacing(spacing: 20),
            commonHeaderTitle(title: "Deal Owner", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
            commonHeaderTitle(title: "Company *", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
            commonVerticalSpacing(spacing: 8),
            commonHeaderTitle(title: "Contact Name *", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
            commonVerticalSpacing(spacing: 8),
            commonHeaderTitle(title: "Stage *", isChangeColor: true,color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
            commonVerticalSpacing(spacing: 8),
            commonHeaderTitle(title: "Deal Source *", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
            commonVerticalSpacing(spacing: 30),
            commonHeaderTitle(title: "Data Source", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
            commonVerticalSpacing(spacing: 20),
            commonHeaderTitle(title: "Data Source", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
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
                  title: selectedDealSource == "" ? "Select Deal Source *" : selectedDealSource,
                  isChangeColor: selectedDealSource == "" ? true : false
              ),
            ),
            commonVerticalSpacing(spacing: 20),
            commonHeaderTitle(title: "Other Information", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
            commonVerticalSpacing(),
            CommonTextFiled(
                fieldTitleText: "Description",
                hintText: "I deal on many products as per the clients requirements",
                maxLine: 6,
                textEditingController: descriptionController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),

            commonVerticalSpacing(spacing: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonHeaderTitle(title: "Associated Products", isChangeColor: true, color: fontColor, fontSize: 1.6,fontWeight: 2),
                Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: yellowColor
                    ),
                    child: commonHeaderTitle(
                        isChangeColor: true,
                        color: subFontColor,
                        fontWeight: 2,
                        fontSize: 1.3,title: "+ Products"
                    )
                )
              ],
            ),
            commonVerticalSpacing(spacing: 20),
            commonHeaderTitle(title: "Category", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
            commonVerticalSpacing(spacing: 8),
            InkWell(
              onTap: (){
                commonBottomView(context: context,
                    child: CommonBottomStringView(
                        hintText: "Category",
                        myItems: const ["advdfbc test","sdvfsdg", "dvdfd","DFSDfs"],
                        selectionCallBack: (
                            String val) {
                          setState(() {
                            selectedCategory = val;
                          });
                        }));
              },
              child: commonDecoratedTextView(
                bottom: 10,
                  title: selectedCategory == "" ? "Search Category" : selectedCategory,
                  isChangeColor: selectedCategory == "" ? true : false
              ),
            ),
            CommonTextFiled(
                fieldTitleText: "Description",
                hintText: "Description",
                maxLine: 6,
                isHeader: false,
                textEditingController: categoryDescriptionController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),
            commonVerticalSpacing(spacing: 20),
            commonHeaderTitle(title: "Product", isChangeColor: true, color: subFontColor, fontSize: 1.15,fontWeight: 2),
            commonVerticalSpacing(spacing: 8),
            InkWell(
              onTap: (){
                commonBottomView(context: context,
                    child: CommonBottomStringView(
                        hintText: "Product",
                        myItems: const ["advdfbc test","sdvfsdg", "dvdfd","DFSDfs"],
                        selectionCallBack: (
                            String val) {
                          setState(() {
                            selectedProduct = val;
                          });
                        }));
              },
              child: commonDecoratedTextView(
                bottom: 10,
                  title: selectedProduct == "" ? "Search Product" : selectedProduct,
                  isChangeColor: selectedProduct == "" ? true : false
              ),
            ),
            CommonTextFiled(
                fieldTitleText: "Make",
                hintText: "Make",
                isHeader: false,
                textEditingController: makeController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),
            commonVerticalSpacing(),
            CommonTextFiled(
                fieldTitleText: "Model",
                hintText: "Model",
                isHeader: false,
                textEditingController: modelController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),
            commonVerticalSpacing(spacing: 20),
            CommonTextFiled(
                fieldTitleText: "List Price",
                hintText: "List Price",
                textEditingController: listPriceController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),
            commonVerticalSpacing(spacing: 20),
            CommonTextFiled(
                fieldTitleText: "Quantity",
                hintText: "Quantity",
                textEditingController: qtyController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),
            commonVerticalSpacing(spacing: 20),
            CommonTextFiled(
                fieldTitleText: "Discount",
                hintText: "Discount",
                textEditingController: discountController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),
            commonVerticalSpacing(spacing: 20),
            CommonTextFiled(
                fieldTitleText: "Total",
                hintText: "Total",
                textEditingController: totalController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),
            commonVerticalSpacing(spacing: 20),
            CommonTextFiled(
                fieldTitleText: "Deal Value",
                hintText: "Deal Value",
                textEditingController: dealValueController,
                onChangedFunction: (String value){
                },
                validationFunction: (String value) {
                  return value.toString().isEmpty
                      ? notEmptyFieldMessage
                      : null;
                }),
            commonVerticalSpacing(),

          ],
        ),
      ),
    );
  }
}

// class MyTableWidget extends StatefulWidget {
//   const MyTableWidget({super.key});
//
//   @override
//   _MyTableWidgetState createState() => _MyTableWidgetState();
// }
//
// class _MyTableWidgetState extends State<MyTableWidget> {
//   final List<DataRow> _rows = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // initialize the rows with empty text fields
//     for (int i = 0; i < 5; i++) {
//       _rows.add(DataRow(
//         cells: [
//           DataCell(CommonDropdownView(listData: const ["aaaaa","sssss","ddddd"],selectedVal: "sssss",changeCallback: (){},)),
//           DataCell(CommonDropdownView(listData: const ["aaaaaaa","sssssaa","dddddaa"],selectedVal: "sssssaa",changeCallback: (){},)),
//           DataCell(CommonProductTextField(
//             selectionCallBack: (String val){},
//             fieldHeader: "",
//             selectedVal: "",
//           )),
//           DataCell(CommonProductTextField(
//             selectionCallBack: (String val){},
//             fieldHeader: "",
//             selectedVal: "",
//           )),
//           DataCell(CommonProductTextField(
//             selectionCallBack: (String val){},
//             fieldHeader: "",
//             selectedVal: "",
//           )),
//           DataCell(CommonProductTextField(
//             selectionCallBack: (String val){},
//             fieldHeader: "",
//             selectedVal: "",
//           )), DataCell(InkWell(
//             onTap: (){},
//             child: const Icon(Icons.close,color: dangerColor),
//           )),
//         ],
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         columns: [
//           DataColumn(label: commonHeaderTitle(title: "Category",fontSize: 1.2,fontWeight: 2)),
//           DataColumn(label: commonHeaderTitle(title: "Product",fontSize: 1.2,fontWeight: 2)),
//           DataColumn(label: commonHeaderTitle(title: "List Price(₹)",fontSize: 1.2,fontWeight: 2)),
//           DataColumn(label: commonHeaderTitle(title: "Quantity",fontSize: 1.2,fontWeight: 2)),
//           DataColumn(label: commonHeaderTitle(title: "Discount(%)(₹)",fontSize: 1.2,fontWeight: 2)),
//           DataColumn(label: commonHeaderTitle(title: "Total(₹)",fontSize: 1.2,fontWeight: 2)),
//           DataColumn(label: commonHeaderTitle(title: "",fontSize: 1.2,fontWeight: 2)),
//         ],
//         rows: _rows,
//       ),
//     );
//   }
// }
