import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widgets_view.dart';
import '../../utility/assets_utility.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';
import 'add_new_product_view.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonHeaderTitle(title: "Products", fontSize: isTablet() ? 1.8 : 1.5,
                  fontWeight: 3,isChangeColor: true,color: blackColor),
              commonFillButtonView(
                  context: context,
                  title: "+ Product",
                  width: 80,
                  height: 35,
                  tapOnButton: () {
                    Get.to(() => const AddNewProductView());
                  },
                  isLoading: false)
            ],
          ),
          commonVerticalSpacing(),
          Row(
            children: [
              Expanded(
                child: Neumorphic(
                  style: const NeumorphicStyle(
                      color: textBgColor,
                      depth: -4,
                      intensity: 8
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search Here....",
                        hintStyle: TextStyle(
                            color: subFontColor
                        ),
                        suffixIcon: Icon(Icons.close),
                        border: InputBorder.none
                    ),
                    onChanged: (String value){
                    },
                  ),
                ),
              ),
              commonHorizontalSpacing(spacing: 16),
              neuMorphicWidget(
                radius: 0,
                margin: 0,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.filter_list_alt,
                    color: subFontColor,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          commonVerticalSpacing(),
          Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return neuMorphicWidget(
                radius: 8,
                margin: 18,
                child: Container(
                  padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8,right: 8),
                  decoration: BoxDecoration(
                      color: textBgColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      neuMorphicWidget(
                          shape: NeumorphicShape.concave,
                          radius: 24,
                          margin: 0,child: Container(color: Colors.grey.shade300,
                        height: 40,width: 40,)),
                      commonHorizontalSpacing(spacing: 12),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "PRODUCT NAME", fontSize: 1,fontWeight: 2),
                              ],
                            ),
                            commonVerticalSpacing(),
                            Row(
                              children: [
                                commonHeaderTitle(title: "CB00002", fontSize: 0.8,isChangeColor: true,color: fontColor,align: TextAlign.start),
                              ],
                            ),
                            commonVerticalSpacing(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "PRODUCT OWNER", fontSize: 0.9,fontWeight: 2),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                      },
                                      child: neuMorphicWidget(
                                          margin: 0,
                                          radius: 4,
                                          child: Container(
                                              padding: const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4),
                                                  color: textBgColor
                                              ),
                                              child: Image(image: editImage,height: 20,width: 20,)
                                          )
                                      ),
                                    ),
                                    commonHorizontalSpacing(),
                                    InkWell(
                                      onTap: (){
                                      },
                                      child: neuMorphicWidget(
                                          margin: 0,
                                          radius: 4,
                                          child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: yellowColor
                                              ),
                                              child: const Icon(Icons.circle,size: 12,color: dangerColor)
                                          )
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },))
        ],
      ),
    );
  }
}
