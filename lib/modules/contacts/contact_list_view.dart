import 'package:crm_app/utility/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widgets/common_widgets_view.dart';
import '../../utility/screen_utility.dart';
import 'add_new_contact_view.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
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
              commonHeaderTitle(title: "All Contacts", fontSize: isTablet() ? 1.5 : 1.3, fontWeight: 4,isChangeColor: true,color: greyColor),
              commonFillButtonView(
                  context: context,
                  title: "+ Contact",
                  width: 80,
                  height: 35,
                  tapOnButton: () {
                    Get.to(() => const AddContactView());
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
                        commonHeaderTitle(title: "CONTACT NAME", fontSize: 1,fontWeight: 2),
                        commonHeaderTitle(title: "COMPANY NAME", fontSize: 1,fontWeight: 2),
                      ],
                    ),
                    commonVerticalSpacing(spacing: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(title: "EMAIL", fontSize: 1),
                        commonHeaderTitle(title: "MOBILE NO", fontSize: 1),
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
                ),
              );
            },))
        ],
      ),
    );
  }
}
