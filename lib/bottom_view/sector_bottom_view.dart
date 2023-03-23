import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/common_textfield.dart';
import '../common_widgets/common_widgets_view.dart';
import '../model/account_response_model.dart';

class SectorBottomView extends StatefulWidget {
  final String title;
  final List<Sector> myItems;
  final Function? selectionCallBack;
  const SectorBottomView({Key? key, required this.myItems, this.selectionCallBack, required this.title}) : super(key: key);

  @override
  State<SectorBottomView> createState() => _AddressBottomViewState();
}

class _AddressBottomViewState extends State<SectorBottomView> {
  TextEditingController searchController = TextEditingController();
  List<Sector> searchedItems = [];

  @override
  void initState() {
    searchedItems = List.from(widget.myItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ListView(
        shrinkWrap: true,
        children: [
          commonVerticalSpacing(spacing: 15),
          commonHeaderTitle(title: widget.title,fontWeight: 2,fontSize: 1.5),
          commonVerticalSpacing(spacing: 15),
          CommonTextFiled(
            fieldTitleText: "Search",
            hintText: "Search",
            // isBorderEnable: false,
            isChangeFillColor: true,
            textEditingController: searchController,
            onChangedFunction: (String value){
              setState(() {
                if(value.isEmpty){
                  searchedItems = widget.myItems;
                }else{
                  searchedItems = widget.myItems.where((p0) => p0.name!.toLowerCase().startsWith(value.toLowerCase())).toList();
                }
              });
            },
          ),
          commonVerticalSpacing(spacing: 30),
          ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchedItems.length,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  Get.back();
                  widget.selectionCallBack!(searchedItems[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: commonHeaderTitle(
                      title: searchedItems[index].name ?? "",
                      fontSize: 1.2
                  ),
                ),
              )
          ),
          commonVerticalSpacing(spacing: 30),
        ],
      ),
    );
  }
}
