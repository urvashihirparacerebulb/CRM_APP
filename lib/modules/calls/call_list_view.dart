import 'package:crm_app/modules/calls/add_new_call_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widgets_view.dart';
import '../../utility/assets_utility.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';

class CallListView extends StatefulWidget {
  const CallListView({Key? key}) : super(key: key);

  @override
  State<CallListView> createState() => _CallListViewState();
}

class _CallListViewState extends State<CallListView> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppbar(context: context,title: "Calls",
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
        child: ColoredBox(
          color: textBgColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonHeaderTitle(title: "All Calls", fontSize: isTablet() ? 1.8 : 1.5,
                        fontWeight: 3,isChangeColor: true,color: blackColor),
                    commonFillButtonView(
                        context: context,
                        title: "+ Call",
                        width: 80,
                        height: 35,
                        tapOnButton: () {
                          Get.to(() => const AddNewCallView());
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
                        padding: const EdgeInsets.only(left: 15,top: 16,bottom: 8,right: 8),
                        decoration: BoxDecoration(
                            color: textBgColor,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "CALL TYPE", fontSize: 1.3,fontWeight: 2),
                                commonHeaderTitle(title: "CALL START TIME", fontSize: 1.1),
                              ],
                            ),
                            commonVerticalSpacing(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "CALL DURATION", fontSize: 1.1),
                                commonHeaderTitle(title: "OWNER", fontSize: 1.1),
                              ],
                            ),
                            commonVerticalSpacing(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "RELATED TO", fontSize: 1),
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
                                              padding: const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: yellowColor
                                              ),
                                              child: Image(
                                                  image: deleteIconImage,
                                                  height: 22,width: 22
                                              )
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
                    );
                  },))
              ],
            ),
          ),
        )
    );
  }
}
