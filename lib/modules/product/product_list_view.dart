import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widgets_view.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';
import 'add_new_product_view.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          commonVerticalSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonHeaderTitle(title: "All Product", fontSize: isTablet() ? 1.5 : 1.3, fontWeight: 4,isChangeColor: true,color: greyColor),
              commonFillButtonView(
                  context: context,
                  title: "+ Product",
                  width: 90,
                  height: 35,
                  tapOnButton: () {
                    Get.to(() => const AddNewProductView());
                  },
                  isLoading: false)
            ],
          ),
          commonVerticalSpacing(),
          Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8,right: 8),
                decoration: neurmorphicBoxDecoration,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(title: "PRODUCT NAME", fontSize: 1.3,fontWeight: 2),
                        commonHeaderTitle(title: "PRODUCT CODE", fontSize: 1.3,fontWeight: 2),
                      ],
                    ),
                    commonVerticalSpacing(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(title: "PRODUCT OWNER", fontSize: 1),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade200
                                ),
                                child: const Icon(Icons.more_horiz,color: ourBlueColor,size: 20,)),
                            commonHorizontalSpacing(),
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade200
                                ),
                                child: const Icon(Icons.edit,color: ourBlueColor,size: 20,))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },))
        ],
      ),
    );
  }
}
