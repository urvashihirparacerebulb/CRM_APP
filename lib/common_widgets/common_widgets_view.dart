import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../controllers/general_controller.dart';
import '../theme/convert_theme_colors.dart';
import '../utility/color_utility.dart';
import '../utility/common_methods.dart';
import '../utility/screen_utility.dart';
import '../utility/theme_utils.dart';


BorderRadius commonBorderRadius = BorderRadius.circular(12.0);
BorderRadius commonButtonBorderRadius = BorderRadius.circular(10.0);

BoxDecoration neurmorphicBoxDecoration = BoxDecoration(
  boxShadow: GeneralController.to.isDarkMode.value ? [
    BoxShadow(
      color: Colors.white.withOpacity(0.1),
      offset: const Offset(-5.0, -6.0),
      blurRadius: 16.0,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      offset: const Offset(6.0, 6.0),
      blurRadius: 16.0,
    ),
  ] : [
    BoxShadow(
      color: Colors.white.withOpacity(0.8),
      offset: const Offset(-5.0, -6.0),
      blurRadius: 16.0,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: const Offset(6.0, 6.0),
      blurRadius: 16.0,
    ),
  ],
  color: ConvertTheme.convertTheme.getBackGroundColor(),
  borderRadius: BorderRadius.circular(12.0),
);

Widget commonStructure({
  required BuildContext context,
  required Widget child,
  PreferredSize? appBar,
  Color bgColor = textBgColor,
  Widget? bottomNavigation,
  Widget? floatingAction,
}) {
  ///Pass null in appbar when it's optional ex = appBar : null
  return Stack(
    children: [
      commonAppBackground(),
      Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        bottomNavigationBar: bottomNavigation,
        floatingActionButton: floatingAction,
        ///adding listView cause scroll issue
        body: Container(
          height: getScreenHeight(context),
          color: Colors.transparent,
          child: child,
        ),
      ),
    ],
  );
}

Widget commonAppBackground() {
  return Obx(() {
    return Container(
      decoration: BoxDecoration(
        color: ConvertTheme.convertTheme.getBackGroundColor(),
      ),
    );
  });
}


PreferredSize commonSearchAppBar({BuildContext? context,
  Widget? leadingWidget, String? title, Widget? actionIcon}) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: AppBar(
        centerTitle: true,
        // this is all you need
        backgroundColor: whiteColor,
        // or use Brightness.dark
        leading: leadingWidget ?? Container(),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Obx(() => Text(
          isNotEmptyString(title) ? GeneralController.to.accountTitle.value : GeneralController.to.dashBoardTitle.value,
          textAlign: TextAlign.center,
          style: black18PxBold,
        )),
        actions: [actionIcon ?? Container()],
      ));
}

Text commonHeaderTitle({String title = "",
  double height = 1.0,
  double fontSize = 1,int fontWeight = 0,
  Color color = fontColor,
  bool isChangeColor = false,
  TextAlign align = TextAlign.start,
  FontStyle fontStyle = FontStyle.normal}){
  return Text(
    title,
    style: white14PxNormal
        .apply(
        color: isChangeColor ? color : ConvertTheme.convertTheme.getWhiteToFontColor(),
        fontStyle: fontStyle,
        fontSizeFactor: fontSize,
        fontFamily: "Poppins",
        fontWeightDelta: fontWeight)
        .merge(TextStyle(height: height)),
    textAlign: align,
  );
}

void commonBottomView(
    {BuildContext? context,
      Widget? child}) {
  showModalBottomSheet(
      context: context!,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: textBgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (builder) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: child
          ),
        );
      });
}

Widget commonBorderButtonView(
    {required BuildContext context,
      required String title,
      required Function tapOnButton,
      required bool isLoading,
      Color? color,
      double height = 50,
      double? width,
      IconData? iconData}) {
  return Container(
    decoration: neurmorphicBoxDecoration,
    width: width ?? MediaQuery.of(context).size.width - (commonHorizontalPadding * 2),
    height: height,
    child: ElevatedButton(
      onPressed: () {
        if (!isLoading) {
          tapOnButton();
        }
      },
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: textBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: commonBorderRadius
        ),
        padding: EdgeInsets.symmetric(vertical: height == 50.0 ? 15 : 2),
        elevation: 0.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: black15PxW800.copyWith(
                color: blackColor,
                fontWeight: FontWeight.bold,
                fontSize: height >= 50.0 ? 16 : 12
            ),
          ),
          iconData != null ? commonHorizontalSpacing() : const SizedBox(),
          iconData != null
              ? Icon(
            iconData,
            size: 20,
            color: blackColor)
              : const SizedBox()
        ],
      ),
    ),
  );
}

Widget commonFillButtonView(
    {required BuildContext context,
      required String title,
      required Function tapOnButton,
      required bool isLoading,
      bool isLightButton = false,
      Color color = yellowColor,
      Color? fontColor = blackColor,
      double? height = 52.0,
      double? width}) {
  return SizedBox(
      width: width ?? MediaQuery
          .of(context)
          .size
          .width - (commonHorizontalPadding * 2),
      height: height,
      child: InkWell(
        onTap: (){
          if (!isLoading) {
            tapOnButton();
          }
        },
        child: Neumorphic(
          style: NeumorphicStyle(
            color: color
          ),

          // onPressed: () {
          //   if (!isLoading) {
          //     tapOnButton();
          //   }
          // },
          // style: ElevatedButton.styleFrom(
          //   shadowColor: blackColor.withOpacity(0.8), backgroundColor: color,
          //   shape: RoundedRectangleBorder(
          //       borderRadius: commonButtonBorderRadius),
          //   padding: EdgeInsets.symmetric(vertical: height == 50.0 ? 15 : 2),
          //   elevation: 5.0,
          // ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: black15PxW800.copyWith(
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: height! >= 50.0 ? 16 : 14
                ),
              ),
            )
        ),
      )
  );
}

commonDecoratedTextView({String title = "", bool isChangeColor = false,double bottom = 16}){
  return Padding(
    padding: EdgeInsets.only(bottom: bottom),
    child: SizedBox(
      height: 50,
      child: neuMorphicWidget(
        // padding: const EdgeInsets.all(12),
        // margin: EdgeInsets.only(bottom: bottom),
        // decoration: neurmorphicBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonHeaderTitle(
                  title: title,
                  isChangeColor: isChangeColor,
                  fontSize: isTablet() ? 1.4 : 1.1,
                  color: subFontColor
              ),
              commonHorizontalSpacing(),
              Icon(Icons.keyboard_arrow_down,
                  color: ConvertTheme.convertTheme.getWhiteToFontColor()
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget commonCheckBoxTile({Function? callback,bool isSelected = false, String title = "",bool enable = true}){
  return CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    visualDensity: VisualDensity.comfortable,
    title: Text(title),
    value: isSelected,
    activeColor: greenColor,
    enabled: enable,
    onChanged: (bool? value) {
      callback!(value);
    },
  );
}

PreferredSize commonAppbar({BuildContext? context,
  String title = "",
  bool isLeadingCCustom = false,
  Widget? leadingWidget,
  List<Widget>? actionsWidgets,
  bool centerTitle = false}){
  return PreferredSize(
    preferredSize: const Size.fromHeight(56.0),
    child: Obx(() {
      return AppBar(
        backgroundColor: textBgColor,
        centerTitle: centerTitle,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: commonHeaderTitle(title: title,fontSize: 1.3,fontWeight: 2,align: TextAlign.center),
        ),
        leading: isLeadingCCustom ? leadingWidget! : InkWell(
            onTap: (){
              Get.back();
            },
            child: Container()
        ),actions: actionsWidgets ?? [],
      );
    }),
  );
}

commonVerticalSpacing({double spacing = 10}){
  return SizedBox(height: spacing);
}

commonHorizontalSpacing({double spacing = 10}){
  return SizedBox(width: spacing);
}

neuMorphicWidget({Widget? child, double radius = 8,double margin = 12,NeumorphicShape shape = NeumorphicShape.flat}){
  return Neumorphic(
      margin: EdgeInsets.only(top: margin),
      style: NeumorphicStyle(
        color: textBgColor,
        shape: shape,
        depth: 5,
        // surfaceIntensity: 1,
        intensity: 0.9,
        boxShape:
        NeumorphicBoxShape.roundRect(BorderRadius.circular(radius)),
        //border: NeumorphicBorder()
      ),
      // padding: const EdgeInsets.all(12.0),
      child: child!
  );
}