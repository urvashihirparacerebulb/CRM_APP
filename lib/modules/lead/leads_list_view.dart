import 'package:crm_app/modules/lead/add_new_lead_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widgets_view.dart';
import '../../controllers/lead_controller.dart';
import '../../utility/assets_utility.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';

class LeadsView extends StatefulWidget {
  const LeadsView({Key? key}) : super(key: key);

  @override
  State<LeadsView> createState() => _LeadsViewState();
}

class _LeadsViewState extends State<LeadsView> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    LeadController.to.getLeadListAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonHeaderTitle(title: "All Leads", fontSize: isTablet() ? 1.8 : 1.5,
                  fontWeight: 3,isChangeColor: true,color: blackColor),
              commonFillButtonView(
                  context: context,
                  title: "+ New",
                  width: 80,
                  height: 35,
                  tapOnButton: () {
                    Get.to(() => const AddNewLeadView());
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
          Expanded(child: Obx((){
            return ListView.builder(
              shrinkWrap: true,
              itemCount: LeadController.to.leadList.length,
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
                            margin: 0,child: Image.network("https://crm.cerebulb.com/images/company/company_logo_59485.png",
                          height: 40,width: 40,)),
                        commonHorizontalSpacing(spacing: 12),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  commonHeaderTitle(title: LeadController.to.leadList[index].leadName ?? "", fontSize: 1.3,fontWeight: 2),
                                  commonHeaderTitle(title: LeadController.to.leadList[index].leadSector ?? "", fontSize: 1.3,fontWeight: 2),
                                ],
                              ),
                              commonVerticalSpacing(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  commonHeaderTitle(title: LeadController.to.leadList[index].leadCompanyName ?? "", fontSize: 1),
                                  commonHeaderTitle(title: LeadController.to.leadList[index].adminName ?? "", fontSize: 1),
                                ],
                              ),
                              commonVerticalSpacing(spacing: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  commonHeaderTitle(title: LeadController.to.leadList[index].stageName ?? "", fontSize: 1),
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
              },);
          }))
        ],
      ),
    );
  }
}
