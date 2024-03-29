import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/convert_theme_colors.dart';
import '../utility/color_utility.dart';
import '../utility/screen_utility.dart';
import '../utility/theme_utils.dart';
import 'common_widgets_view.dart';

OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: commonBorderRadius,
);

class CommonTextFiled extends StatefulWidget {
  final String fieldTitleText;
  final String hintText;
  final bool isPassword;
  final bool isRequired;
  final bool isHeader;
  final TextEditingController textEditingController;
  final Function? validationFunction;
  final int? maxLength;
  final Function? onSavedFunction;
  final Function? onFieldSubmit;
  final TextInputType? keyboardType;
  final Function? onTapFunction;
  final Function? onChangedFunction;
  final List<TextInputFormatter>? inputFormatter;
  final bool isEnabled;
  final bool isReadOnly;
  final int? errorMaxLines;
  final int? maxLine;
  final FocusNode? textFocusNode;
  final GlobalKey<FormFieldState>? formFieldKey;
  final TextAlign align;
  final Widget? suffixIcon;
  final Color fontColor;
  final Widget? preFixIcon;
  final bool isShowTitle;
  final Color? fillColor;
  final bool isChangeFillColor;

  const CommonTextFiled(
      {required this.fieldTitleText,
        required this.hintText,
        this.isPassword = false,
        this.isRequired = true,
        this.isHeader = true,
        required this.textEditingController,
        this.validationFunction,
        this.maxLength,
        this.onSavedFunction,
        this.onFieldSubmit,
        this.keyboardType,
        this.onTapFunction,
        this.onChangedFunction,
        this.isChangeFillColor = false,
        this.inputFormatter,
        this.isEnabled = true,
        this.isReadOnly = false,
        this.errorMaxLines,
        this.maxLine = 1,
        this.textFocusNode,
        this.formFieldKey,
        this.align = TextAlign.start,
        this.suffixIcon,
        this.preFixIcon,
        this.isShowTitle = false,
        this.fontColor = ourBlueColor,
        this.fillColor});

  @override
  _CommonTextFiledState createState() => _CommonTextFiledState();
}

class _CommonTextFiledState extends State<CommonTextFiled> {
  bool? passwordVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        passwordVisible = widget.isPassword;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonVerticalSpacing(spacing: widget.isHeader ? 10 : 0),
        if(widget.isHeader)
          commonHeaderTitle(title: widget.fieldTitleText, isChangeColor: true, color: subFontColor,
              fontSize: 1.15,fontWeight: 2 ),
        commonVerticalSpacing(spacing: widget.isHeader ? 3 : 0),
        SizedBox(
          height: widget.maxLine == 1 ? 50 : (widget.maxLine! * 24),
          child: neuMorphicWidget(
            child: TextFormField(
              enabled: !widget.isEnabled ? false : true,
              textAlign: widget.align,
              textInputAction: TextInputAction.done,
              showCursor: !widget.isReadOnly,
              onTap: () {
                if (widget.onTapFunction != null) {
                  widget.onTapFunction!();
                }
              },
              key: widget.key,
              focusNode: widget.textFocusNode,
              onChanged: (value) {
                if (widget.onChangedFunction != null) {
                  widget.onChangedFunction!(value);
                }
              },
              validator: (value) {
                return widget.validationFunction != null
                    ? widget.validationFunction!(value)
                    : null;
              },
              onSaved: (value) {
                // ignore: void_checks
                return widget.onSavedFunction != null
                    ? widget.onSavedFunction!(value)
                    : null;
              },
              onFieldSubmitted: (value) {
                // ignore: void_checks
                return widget.onFieldSubmit != null
                    ? widget.onFieldSubmit!(value)
                    : null;
              },
              maxLines: widget.maxLine ?? 1,
              keyboardType: widget.keyboardType,
              controller: widget.textEditingController,
              cursorColor: widget.fontColor,
              // initialValue: initialText,
              obscureText: passwordVisible!,
              style: black15PxW800.copyWith(
                  fontSize: isTablet() ? 18 : 15,
                  color: blackColor,fontWeight: FontWeight.normal),
              inputFormatters: widget.inputFormatter,
              decoration: InputDecoration(
                labelStyle: black15PxW800.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: isTablet() ? 18 : 15,
                    color: blackColor.withOpacity(0.4)),
                labelText: widget.hintText,
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                errorMaxLines: widget.errorMaxLines ?? 1,
                filled: true,
                contentPadding: const EdgeInsets.only(top: 22, left: 15),
                focusedBorder: textFieldBorderStyle,
                disabledBorder: textFieldBorderStyle,
                enabledBorder: textFieldBorderStyle,
                errorBorder: textFieldBorderStyle,
                focusedErrorBorder: textFieldBorderStyle,
                hintText: widget.hintText,
                fillColor: widget.isChangeFillColor ? bgColor.withOpacity(0.8) : ConvertTheme.convertTheme.getTextFiledBackGroundColor(),
                hintStyle: white14PxNormal.copyWith(
                    color: blackColor.withOpacity(0.4),
                    fontSize: isTablet() ? 19 : 16),
                suffixIcon: widget.isPassword
                    ? InkWell(
                    onTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible!;
                      });
                    },
                    child: passwordVisible!
                        ? const Icon(
                      Icons.visibility_off,
                      color: blackColor,
                    )
                        : const Icon(
                      Icons.remove_red_eye_sharp,
                      color: blackColor,
                    ))
                    : widget.suffixIcon,
                prefixIcon: widget.preFixIcon != null
                    ? Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: widget.preFixIcon,
                )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

