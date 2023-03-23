import 'package:crm_app/utility/color_utility.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/common_widgets_view.dart';

class AccountAddressView extends StatefulWidget {
  const AccountAddressView({Key? key}) : super(key: key);

  @override
  State<AccountAddressView> createState() => _AccountAddressViewState();
}

class _AccountAddressViewState extends State<AccountAddressView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: greyColor.withOpacity(0.2))
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on,color: Colors.greenAccent.shade200),
                    commonHorizontalSpacing(),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonHeaderTitle(title: "Corporate Office",fontSize: 1.3,fontWeight: 3),
                        commonVerticalSpacing(spacing: 5),
                        commonHeaderTitle(title: "New Delhi",fontSize: 1.1,isChangeColor: true,color: greyColor),
                        commonVerticalSpacing(),
                      ],
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ourBlueColor
                        ),
                        child: const Icon(Icons.edit,color: whiteColor,size: 20,)),
                    commonHorizontalSpacing(),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: dangerColor
                        ),
                        child: const Icon(Icons.delete_outline,color: whiteColor,size: 20,)),
                  ],
                ),
                commonVerticalSpacing(),
                const Divider(color: greyColor),
                commonVerticalSpacing(),
                commonHeaderTitle(title: "IFFCO Sadan, C-1, District Centre, Sanket Place, New Delhi",fontSize: 1.2,isChangeColor: true,color: blackColor),
                commonVerticalSpacing(),
                commonHeaderTitle(title: "Saket (South Delhi),",fontSize: 1.2,isChangeColor: true,color: blackColor),
                commonVerticalSpacing(),
                commonHeaderTitle(title: "Delhi,",fontSize: 1.2,isChangeColor: true,color: blackColor),
                commonVerticalSpacing(),
                commonHeaderTitle(title: "India,110017",fontSize: 1.2,isChangeColor: true,color: blackColor)
              ],
            ),
          )
        ],
      ),
    );
  }
}
