import 'package:crm_app/controllers/account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../common_widgets/common_widgets_view.dart';
import '../../utility/assets_utility.dart';
import '../../utility/color_utility.dart';

class AccountDetailView extends StatefulWidget {
  const AccountDetailView({Key? key}) : super(key: key);

  @override
  State<AccountDetailView> createState() => _AccountDetailViewState();
}

class _AccountDetailViewState extends State<AccountDetailView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isAccStatus = false;

  expandedView({String title = "", subTitle = ""}){
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonHeaderTitle(title: title,height: 1.2,
            fontSize: 1.2,fontWeight: 1,isChangeColor: true,color: subFontColor),
        commonVerticalSpacing(spacing: 5),
        commonHeaderTitle(title: subTitle,height: 1.3,
            fontSize: 0.9,isChangeColor: true,color: const Color(0xFFA4A9B2))
      ],
    ));
  }

  subExpandedView({String title = "", subTitle = "", bool isImage = false}){
    return Row(
      children: [
        Expanded(flex: 3,child: commonHeaderTitle(title: title,height: 1.2,
            fontSize: 1.2,fontWeight: 1,isChangeColor: true,color: subFontColor)),
        Expanded(flex: 4,child: isImage ? Image(image: dummyProfileImage,height: 30,width: 30,) : commonHeaderTitle(title: subTitle,height: 1.3,
            fontSize: 0.9,isChangeColor: true,color: const Color(0xFFA4A9B2))),
        Expanded(flex: 1,child: Container())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textBgColor,
      key: _scaffoldKey,
      appBar: commonAppbar(context: context,title: "Account Profile",
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
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          neuMorphicWidget(
            radius: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      neuMorphicWidget(
                          shape: NeumorphicShape.concave,
                          radius: 24,
                          margin: 0,child: Container(color: Colors.grey.shade300,
                          height: 40,width: 40,)
                      ),
                      commonHorizontalSpacing(spacing: 10),
                      commonHeaderTitle(title: "Cairn Oil and Gas",height: 1.2,
                          fontSize: 1.15,fontWeight: 2,isChangeColor: true,color: fontColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                        },
                        child: neuMorphicWidget(
                            margin: 0,
                            radius: 4,
                            child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: yellowColor
                                ),
                                child: const Icon(Icons.add,color: subFontColor,size: 20)
                            )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ),
          commonVerticalSpacing(spacing: 20),
          neuMorphicWidget(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: accountImage,
                            height: 40,width: 40),
                          commonHorizontalSpacing(spacing: 10),
                          commonHeaderTitle(title: "Account Information",height: 1.2,
                              fontSize: 1.4,fontWeight: 1,isChangeColor: true,color: fontColor)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                                    child: Image(image: editImage,height: 20,width: 20)
                                )
                            ),
                          ),
                          commonHorizontalSpacing(),
                          InkWell(
                            onTap: (){
                              AccountController.to.isAccInfoExpanded.value = !AccountController.to.isAccInfoExpanded.value;
                            },
                            child: const Icon(Icons.keyboard_arrow_up_rounded,color: fontColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Obx(() => AccountController.to.isAccInfoExpanded.value ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        children: [
                          expandedView(title: "Account Owner*", subTitle: "Hitesh Patel"),
                          expandedView(title: "Industry*", subTitle: "Chemicals")
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        children: [
                          expandedView(title: "Account Name*", subTitle: "JSW Paints Private Limited"),
                          expandedView(title: "Account Type*", subTitle: "Channel Partner")
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        children: [
                          expandedView(title: "Ownership*", subTitle: "Cerebulb India Pvt. Ltd."),
                          expandedView(title: "Parent Account", subTitle: "JSW Group")
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        children: [
                          expandedView(title: "Website", subTitle: "www.jswpaints.in"),
                          expandedView(title: "Fax", subTitle: "Fax")
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        children: [
                          expandedView(title: "Description", subTitle: "Cairn India was an Indian oil and gas exploration and production company, headquartered in Gurgaon, India.The company was merged with Vedanta Limited."),
                        ],
                      ),
                    ],
                  ) : Container()),
                  commonVerticalSpacing(spacing: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: addressImage,
                              height: 40,width: 40),
                          commonHorizontalSpacing(spacing: 10),
                          commonHeaderTitle(title: "Address",height: 1.2,
                              fontSize: 1.4,fontWeight: 1,isChangeColor: true,color: fontColor)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          commonFillButtonView(
                              context: context,
                              title: "Add Address",
                              width: 120,
                              height: 35,
                              tapOnButton: () {
                              },
                              isLoading: false),
                          commonHorizontalSpacing(),
                          InkWell(
                            onTap: (){
                              AccountController.to.isAddressExpanded.value = !AccountController.to.isAddressExpanded.value;
                            },
                            child: const Icon(Icons.keyboard_arrow_up_rounded,color: fontColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Obx(() => AccountController.to.isAddressExpanded.value ? Column(
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              commonHeaderTitle(title: "Plant/Factory, Vijayanagar",height: 1.2,
                                  fontSize: 1.2,fontWeight: 1,isChangeColor: true,color: subFontColor),
                              commonVerticalSpacing(spacing: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: commonHeaderTitle(title: "Kudligi Rd, Toranagallu, Karnataka Toranagallu,Karnataka, India,583123",
                                      height: 1.3,
                                      fontSize: 0.9,isChangeColor: true,
                                      color: const Color(0xFFA4A9B2)),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                              ),

                              commonVerticalSpacing(spacing: 30)
                            ],
                          );

                        },),
                    ],
                  ) : Container()),
                  commonVerticalSpacing(spacing: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: addressImage,
                              height: 40,width: 40),
                          commonHorizontalSpacing(spacing: 10),
                          commonHeaderTitle(title: "Contacts",height: 1.2,
                              fontSize: 1.4,fontWeight: 1,isChangeColor: true,color: fontColor)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          commonFillButtonView(
                              context: context,
                              title: "+ New",
                              width: 120,
                              height: 35,
                              tapOnButton: () {
                              },
                              isLoading: false),
                          commonHorizontalSpacing(),
                          InkWell(
                            onTap: (){
                              AccountController.to.isContactExpanded.value = !AccountController.to.isContactExpanded.value;
                            },
                            child: const Icon(Icons.keyboard_arrow_up_rounded,color: fontColor),
                          ),
                        ],
                      )
                    ],
                  ),

                  Obx(() =>  AccountController.to.isContactExpanded.value ? Column(
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          subExpandedView(title: "Photo", subTitle: "Rohit Gupta",isImage: true),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Name", subTitle: "Rohit Gupta"),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Email ID", subTitle: "rohitgupta12@gmail.com"),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Phone", subTitle: "+91 9641124247"),
                          commonVerticalSpacing(),
                          Row(
                            children: [
                              Expanded(flex: 3 ,child: commonHeaderTitle(title: "Account Owner",height: 1.2,
                                  fontSize: 1.2,fontWeight: 1,isChangeColor: true,color: subFontColor)),
                              Expanded(flex: 4, child: commonHeaderTitle(title: "     Hitesh Patel",height: 1.3,
                                  fontSize: 0.9,isChangeColor: true,color: const Color(0xFFA4A9B2))),
                              Expanded(flex: 2, child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                              ))
                            ],
                          )
                        ],
                      )
                    ],
                  ) : Container()),

                  commonVerticalSpacing(spacing: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: notesImage,
                              height: 40,width: 40),
                          commonHorizontalSpacing(spacing: 10),
                          commonHeaderTitle(title: "Notes",height: 1.2,
                              fontSize: 1.4,fontWeight: 1,isChangeColor: true,color: fontColor)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          commonFillButtonView(
                              context: context,
                              title: "Add Notes",
                              width: 120,
                              height: 35,
                              tapOnButton: () {
                              },
                              isLoading: false),
                          commonHorizontalSpacing(),
                          InkWell(
                            onTap: (){
                              AccountController.to.isNotesExpanded.value = !AccountController.to.isNotesExpanded.value;
                            },
                            child: const Icon(Icons.keyboard_arrow_up_rounded,color: fontColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Obx(() => AccountController.to.isNotesExpanded.value ? Column(
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          subExpandedView(title: "Title", subTitle: "Manager"),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Description", subTitle: "I am a Manager"),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Company", subTitle: "Cairn Oil and gas"),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Contact", subTitle: "Hitesh Patel"),
                          commonVerticalSpacing(),
                          Row(
                            children: [
                              Expanded(flex: 3,child: commonHeaderTitle(title: "Deal",height: 1.2,
                                  fontSize: 1.2,fontWeight: 1,isChangeColor: true,color: subFontColor)),
                              Expanded(flex: 4,child: commonHeaderTitle(title: "    Done",height: 1.3,
                                  fontSize: 0.9,isChangeColor: true,color: const Color(0xFFA4A9B2))),
                              Expanded(flex: 2,child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                              ))
                            ],
                          )
                        ],
                      ),
                    ],
                  ) : Container()),

                  commonVerticalSpacing(spacing: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: activitiesImage,
                              height: 40,width: 40),
                          commonHorizontalSpacing(spacing: 10),
                          commonHeaderTitle(title: "Activities",height: 1.2,
                              fontSize: 1.4,fontWeight: 1,isChangeColor: true,color: fontColor)
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          AccountController.to.isActivitiesExpanded.value = !AccountController.to.isActivitiesExpanded.value;
                        },
                        child: const Icon(Icons.keyboard_arrow_up_rounded,color: fontColor),
                      ),
                    ],
                  ),
                  Obx(() => AccountController.to.isActivitiesExpanded.value ? Column(
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonHeaderTitle(title: "Upcoming & Overdue",
                              fontSize: 1.2,fontWeight: 1,isChangeColor: true,color: subFontColor),
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
                                    child: const Icon(Icons.add,color: subFontColor,size: 20)
                                )
                            ),
                          ),
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonHeaderTitle(title: "April 2023",
                              fontSize: 1.2,fontWeight: 1,isChangeColor: true,color: subFontColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
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
                              const Icon(Icons.close,color: subFontColor,)
                            ],
                          )
                        ],
                      ),
                      commonVerticalSpacing(spacing: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Image(image: contactsImage),
                                commonHorizontalSpacing(spacing: 20),
                                Expanded(flex: 4,child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonHeaderTitle(title: "You have a call JSW Steel Limited Avinash Ujjwal",height: 1.3,
                                        fontSize: 0.9,isChangeColor: true,color: const Color(0xFFA4A9B2)),
                                    commonVerticalSpacing(spacing: 8),
                                    commonHeaderTitle(title: "Call Regarding to discuss on JSW PI System and schedule call with Vivek to explain use cases.",height: 1.3,
                                        fontSize: 0.9,isChangeColor: true,color: const Color(0xFFA4A9B2)),
                                    commonVerticalSpacing(spacing: 8),
                                    commonHeaderTitle(title: "Nov 23, 2023 at 10:00 AM",height: 1.3,fontWeight: 1,
                                        fontSize: 0.8,isChangeColor: true,color: subFontColor),
                                  ],
                                )),
                                commonHorizontalSpacing(spacing: 20),
                                const Icon(Icons.keyboard_arrow_up_rounded, color: subFontColor,)
                              ],
                            ),
                          );
                        },),
                    ],
                  ) : Container()),
                  commonVerticalSpacing(spacing: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: dealImage,
                              height: 40,width: 40),
                          commonHorizontalSpacing(spacing: 10),
                          commonHeaderTitle(title: "Deals",height: 1.2,
                              fontSize: 1.4,fontWeight: 1,isChangeColor: true,color: fontColor)
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          AccountController.to.isDealsExpanded.value = !AccountController.to.isDealsExpanded.value;
                        },
                        child: const Icon(Icons.keyboard_arrow_up_rounded,color: fontColor),
                      ),
                    ],
                  ),
                  Obx(() => AccountController.to.isDealsExpanded.value ? Column(
                    children: [
                      commonVerticalSpacing(spacing: 20),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          subExpandedView(title: "Deal Name", subTitle: "Performance Monitoring System"),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Company Name", subTitle: "JSW Steel Limited"),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Account Owner", subTitle: "Hitesh Patel"),
                          commonVerticalSpacing(),
                          subExpandedView(title: "Stage", subTitle: "Proposal/Price Quote"),
                          commonVerticalSpacing(),
                          Row(
                            children: [
                              Expanded(flex: 3,child: commonHeaderTitle(title: "Status",height: 1.2,
                                  fontSize: 1.2,fontWeight: 1,isChangeColor: true,color: subFontColor)),
                              Expanded(flex: 4,child: CupertinoSwitch(
                                // overrides the default green color of the track
                                activeColor: Colors.pink.shade200,
                                // color of the round icon, which moves from right to left
                                thumbColor: blackColor,
                                // when the switch is off
                                trackColor: Colors.black12,
                                // boolean variable value
                                value: isAccStatus,
                                // changes the state of the switch
                                onChanged: (value) => setState(() => isAccStatus = value),
                              ),),
                              Expanded(flex: 2,child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                              ))
                            ],
                          )
                        ],
                      ),
                    ],
                  ) : Container())

                ],
              ),
            )
          )
        ],
      ),
      // drawer: const AccountDrawer(),
      // appBar: commonSearchAppBar(
      //     context: context,
      //     title: GeneralController.to.accountTitle.value,
      //     leadingWidget: InkWell(
      //       child: Container(
      //         alignment: Alignment.centerLeft,
      //         child: Padding(
      //           padding: const EdgeInsets.fromLTRB(20, 4.0, 4.0, 4.0),
      //           child: Image(
      //             image: menuIcon,
      //             color: blackColor,
      //           ),
      //         ),
      //       ),
      //       onTap: () {
      //         _scaffoldKey.currentState!.openDrawer();
      //       },
      //     )
      // ),
      // body: Obx(() => GeneralController.to.accountTitle.value == accountInformation ? const AccountInfoView() :
      // GeneralController.to.accountTitle.value == accountAddress ? const AccountAddressView() :
      // GeneralController.to.accountTitle.value == accountContacts ? const AccountContactsView() :
      // GeneralController.to.accountTitle.value == accountNotes ? const AccountNotesView() :
      // GeneralController.to.accountTitle.value == accountActivity ? const AccountActivityView() :
      // // GeneralController.to.dashBoardTitle.value == accounts ? const AccountListView() :
      // Container()),
    );
  }
}
