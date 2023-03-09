import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widgets_view.dart';
import '../../utility/color_utility.dart';
import '../../utility/screen_utility.dart';
import 'add_new_account_view.dart';

class AccountListView extends StatefulWidget {
  const AccountListView({Key? key}) : super(key: key);

  @override
  State<AccountListView> createState() => _AccountListViewState();
}

class _AccountListViewState extends State<AccountListView> {

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
              commonHeaderTitle(title: "Accounts", fontSize: isTablet() ? 1.5 : 1.3, fontWeight: 4,isChangeColor: true,color: greyColor),
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
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: ourBlueColor
                          ),
                          child: commonHeaderTitle(title: "C", fontSize: 1.4,fontWeight: 2,isChangeColor: true,color: whiteColor),
                        ),
                        commonHorizontalSpacing(spacing: 12),
                        Expanded(child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "COMPANY NAME", fontSize: 1,fontWeight: 2,isChangeColor: true,color: ourBlueColor),
                                commonHeaderTitle(title: "Sector", fontSize: 1),
                              ],
                            ),
                            commonVerticalSpacing(spacing: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "Account Type", fontSize: 1),
                                commonHeaderTitle(title: "Website", fontSize: 1),
                              ],
                            ),
                            commonVerticalSpacing(spacing: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                commonHeaderTitle(title: "ACCOUNT OWNER", fontSize: 1),
                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.yellow.shade800
                                        ),
                                        child: const Icon(Icons.edit,color: whiteColor,size: 20,)),
                                    commonHorizontalSpacing(),
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.redAccent.shade200
                                        ),
                                        child: const Icon(Icons.delete_outline,color: whiteColor,size: 20,))
                                  ],
                                )
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              );
            },))
        ],
      ),
    );
  }
}
