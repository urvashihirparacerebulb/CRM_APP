import 'package:crm_app/controllers/account_controller.dart';
import 'package:crm_app/utility/assets_utility.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widgets_view.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';
import 'acc_detail_view.dart';
import 'add_new_account_view.dart';

class AccountListView extends StatefulWidget {
  const AccountListView({Key? key}) : super(key: key);

  @override
  State<AccountListView> createState() => _AccountListViewState();
}

class _AccountListViewState extends State<AccountListView> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    AccountController.to.getAccountLists(callback: (){});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonHeaderTitle(title: "Accounts", fontSize: isTablet() ? 1.8 : 1.5,
                  fontWeight: 3,isChangeColor: true,color: blackColor),
              commonFillButtonView(
                  context: context,
                  title: "+ New",
                  width: 80,
                  height: 35,
                  tapOnButton: () {
                    Get.to(() => const AddNewAccountView());
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
          Expanded(child: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: AccountController.to.accountLists.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              return neuMorphicWidget(
                radius: 8,
                margin: 18,
                child: Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
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
                          margin: 0,child: Image.network(AccountController.to.accountLists[index].logo ?? "",
                            height: 40,width: 40,)),
                      commonHorizontalSpacing(spacing: 12),
                      Expanded(child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    Get.to(() => const AccountDetailView());
                                  },
                                  child: commonHeaderTitle(title: AccountController.to.accountLists[index].name ?? "",height: 1.2,
                                      fontSize: 1,fontWeight: 2,isChangeColor: true,color: fontColor),
                                ),
                              ),
                              commonHorizontalSpacing(spacing: 20),
                              commonHeaderTitle(title: AccountController.to.accountLists[index].sector ?? "",
                                  fontSize: 1,
                                  isChangeColor: true,color: subFontColor
                              ),
                            ],
                          ),
                          commonVerticalSpacing(spacing: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonHeaderTitle(
                                  title: AccountController.to.accountLists[index].accountType ?? "",
                                  fontSize: 1,isChangeColor: true,color: subFontColor
                              ),
                              commonHorizontalSpacing(spacing: 20),
                              Expanded(child: commonHeaderTitle(title: AccountController.to.accountLists[index].website ?? "",
                                  fontSize: 1,
                                  isChangeColor: true,color: subFontColor,
                                  align: TextAlign.end)),
                            ],
                          ),
                          commonVerticalSpacing(spacing: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonHeaderTitle(
                                  title: AccountController.to.accountLists[index].adminName ?? "",
                                  fontSize: 1,isChangeColor: true,color: fontColor,fontWeight: 1
                              ),
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
                                            child: Image(image: websiteImage,height: 20,width: 20,)
                                        )
                                    ),
                                  ),
                                  commonHorizontalSpacing(),
                                  InkWell(
                                    onTap: (){
                                      Get.to(() => AddNewAccountView(isEdit: true,accId: AccountController.to.accountLists[index].id.toString()));
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
                                      AccountController.to.deleteAccount(companyId: AccountController.to.accountLists[index].id.toString());
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
                      ))
                    ],
                  ),
                )
              );
            })))
        ],
      ),
    );
  }
}
