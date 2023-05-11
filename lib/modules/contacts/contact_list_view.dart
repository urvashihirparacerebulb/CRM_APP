import 'package:crm_app/utility/color_utility.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../common_widgets/common_widgets_view.dart';
import '../../controllers/contact_controller.dart';
import '../../utility/assets_utility.dart';
import '../../utility/screen_utility.dart';
import 'add_new_contact_view.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    ContactController.to.getContactListAPI();
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
              commonHeaderTitle(title: "Contacts", fontSize: isTablet() ? 1.8 : 1.5,
                  fontWeight: 3,isChangeColor: true,color: blackColor),
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
          commonVerticalSpacing(spacing: 20),
          Expanded(child: Obx((){
            return ListView.builder(
              shrinkWrap: true,
              itemCount: ContactController.to.contactList.length,
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonHeaderTitle(title: ContactController.to.contactList[index].fullName ?? "", fontSize: 1.2,fontWeight: 2),
                            commonHorizontalSpacing(spacing: 20),
                            Expanded(child: commonHeaderTitle(title: ContactController.to.contactList[index].accountName ?? "", fontSize: 1.2,fontWeight: 2, align: TextAlign.end),),
                          ],
                        ),
                        commonVerticalSpacing(spacing: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child:commonHeaderTitle(title: ContactController.to.contactList[index].email ?? "", fontSize: 1),),
                            commonHorizontalSpacing(spacing: 20),
                            commonHeaderTitle(title: ContactController.to.contactList[index].mobileNo ?? "", fontSize: 1,align: TextAlign.end),
                          ],
                        ),
                        commonVerticalSpacing(spacing: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonHeaderTitle(title: ContactController.to.contactList[index].adminName ?? "", fontSize: 1),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(() => AddContactView(isEdit: true,contactId: ContactController.to.contactList[index].id.toString()));
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
                );
              },);
          }))
        ]
      ),
    );
  }
}
