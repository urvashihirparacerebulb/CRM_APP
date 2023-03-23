import 'package:crm_app/common_widgets/common_widgets_view.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/common_textfield.dart';
import '../../../utility/constants.dart';

class AccountNotesView extends StatefulWidget {
  const AccountNotesView({Key? key}) : super(key: key);

  @override
  State<AccountNotesView> createState() => _AccountNotesViewState();
}

class _AccountNotesViewState extends State<AccountNotesView> {

  TextEditingController titleController = TextEditingController();
  TextEditingController typeNotesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          CommonTextFiled(
              fieldTitleText: "Title",
              hintText: "Title",
              textEditingController: titleController,
              onChangedFunction: (String value){
              },
              validationFunction: (String value) {
                return value.toString().isEmpty
                    ? notEmptyFieldMessage
                    : null;
              }),
          commonVerticalSpacing(),
          CommonTextFiled(
              fieldTitleText: "Type Notes",
              hintText: "Type Notes",
              textEditingController: typeNotesController,
              onChangedFunction: (String value){
              },
              validationFunction: (String value) {
                return value.toString().isEmpty
                    ? notEmptyFieldMessage
                    : null;
              }),
          commonVerticalSpacing(spacing: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                commonFillButtonView(
                    context: context,
                    title: "Add Notes",
                    width: 90,
                    height: 35,
                    tapOnButton: () {

                    },
                    isLoading: false),
                commonHorizontalSpacing(),
                commonBorderButtonView(
                  context: context,
                  title: "Cancel",
                  width: 90,
                  height: 35,
                  tapOnButton: (){},
                  isLoading: false,
                )
              ],
            )

        ],
      ),
    );
  }
}
