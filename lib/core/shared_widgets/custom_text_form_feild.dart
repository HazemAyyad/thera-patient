import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../theming/styles.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String? hint;
  final String? starText;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final VoidCallback? onPressed;
  final bool secure;
  final bool isNumber;
  final Function(String?)? onSave;
  final int maxLines;
  final bool autoFocus;
  final Widget? suffixIcon;
  final Widget? prefix, prefixIcon;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool isNext;
  final bool isReadOnly;
  final int? maxLength;
  final String? upperText;
  final String? lableText;
  final String? errorText;
  final String? suffixText;
  final bool hasLabel;
  final Color? hintColor;
  final bool isLTR;
  final double horizontalMargin;
  final double verticalMargin;
  final bool multiLine;
  final Color? fillColor;
  final Color? textColor;
  final Color? labelColor;
  final double radius;
  final String? initialValue;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? initialText;
  final TextEditingController? controller;
  final double? prefixWidth;
  final Function(String)? onFieldSubmitted;
  final bool applyShadow;
  final String? prefixSvgAsset;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormFeild({
    super.key,
    this.prefix,
    this.isNumber = false,
    this.maxLines = 1,
    this.onPressed,
    this.onSave,
    this.secure = false,
    this.hint,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.onTap,
    this.isNext = true,
    this.maxLength,
    this.upperText,
    this.hasLabel = false,
    this.isLTR = false,
    this.hintColor = const Color(0xffB8B8B8),
    this.horizontalMargin = 0,
    this.multiLine = false,
    this.fillColor,
    this.textColor,
    this.labelColor,
    this.radius = 10,
    this.verticalMargin = 5,
    this.lableText,
    this.initialValue,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.errorText,
    this.isReadOnly = false,
    this.initialText,
    this.suffixText,
    this.applyShadow = false,
    this.controller,
    this.prefixSvgAsset,
    this.prefixWidth,
    this.inputFormatters,
    this.autoFocus = false,
    this.onFieldSubmitted,
    this.textDirection,
    this.starText,
  });

  @override
  _CustomTextFormFeildState createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  late bool _showPassword;
  late bool _isFocused;

  @override
  void initState() {
    _showPassword = widget.secure;
    _isFocused = widget.autoFocus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.verticalMargin,
        horizontal: widget.horizontalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.upperText != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 14,
                    fontFamily: 'DIN',
                    fontWeight: FontWeight.w400,
                    height: 2,
                  ),
                  children: [
                    TextSpan(
                      text: widget.starText ?? '*',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontFamily: 'DIN',
                        fontWeight: FontWeight.w400,
                        height: 2,
                      ),
                    ),
                    TextSpan(
                      text: widget.upperText ?? '',
                      style: TextStyles.font15Weight400FourthBlack,
                    ),
                  ],
                ),
              ),
            ),
          Directionality(
            textDirection: widget.textDirection ?? TextDirection.rtl,
            child: Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  _isFocused = hasFocus;
                });
              },
              child: TextFormField(
                onFieldSubmitted: widget.onFieldSubmitted,
                autofocus: widget.autoFocus,
                focusNode: widget.focusNode,
                controller: widget.controller ??
                    (widget.initialText != null
                        ? TextEditingController(text: widget.initialText)
                        : null),
                readOnly: widget.isReadOnly,
                initialValue: widget.initialValue,
                obscureText: _showPassword,
                onSaved: widget.onSave,
                onChanged: widget.onChanged,
                inputFormatters:
                widget.inputFormatters ?? [EnglishArabicTextInputFormatter()],
                textDirection: widget.textDirection ?? TextDirection.rtl,
                maxLength: widget.maxLength,
                textInputAction: widget.multiLine
                    ? TextInputAction.newline
                    : widget.isNext
                    ? TextInputAction.next
                    : TextInputAction.done,
                keyboardType: widget.multiLine
                    ? TextInputType.multiline
                    : widget.isNumber
                    ? TextInputType.number
                    : widget.keyboardType,
                cursorColor: const Color(0xff020659),
                validator: widget.validator,
                maxLines: widget.maxLines,
                style: TextStyle(color: widget.textColor ?? Colors.black),

                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: widget.fillColor ?? AppColors.whiteColor,
                  hintText: widget.hint,
                  hintStyle: TextStyles.font15Weight400LightenGrey,
                  prefixIcon: widget.prefixSvgAsset != null
                      ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      widget.prefixSvgAsset!,
                      color: _isFocused
                          ? const Color(0xff020659)
                          : widget.hintColor,
                    ),
                  )
                      : widget.prefixIcon,
                  suffixIcon: widget.secure
                      ? IconButton(
                    icon: Icon(
                      _showPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () =>
                        setState(() => _showPassword = !_showPassword),
                  )
                      : widget.suffixIcon,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EnglishArabicTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue;
  }
}
