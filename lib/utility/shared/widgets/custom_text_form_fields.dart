import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.title,
    this.isPassword = false,
    this.minLines = 1,
    required this.controller,
    this.onChanged,
    this.isReadOnly = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffix,
    this.margin = 12,
  });

  final String hintText;
  final String? title;
  final bool isPassword, isReadOnly;
  final int minLines;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final double margin;

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          if (widget.title != null) const SizedBox(height: 10),
          widget.isPassword
              ? TextFormField(
                  controller: widget.controller,
                  obscureText: obscure,
                  onChanged: widget.onChanged,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    filled: true,
                    focusColor: kWhiteColor,
                    fillColor: kWhiteColor,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                      borderSide: BorderSide.none, // No border
                    ),
                    hintText: widget.hintText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (obscure == false) {
                          obscure = true;
                        } else {
                          obscure = false;
                        }
                        setState(() {});
                      },
                      child: obscure
                          ? Icon(Icons.visibility_off_outlined,
                              color: kBlackColor)
                          : Icon(Icons.visibility_outlined, color: kBlackColor),
                    ),
                    hintStyle: midGreyTextStyle,
                  ),
                )
              : TextFormField(
                  controller: widget.controller,
                  obscureText: widget.isPassword,
                  readOnly: widget.isReadOnly,
                  onChanged: widget.onChanged,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    suffixIcon: widget.suffix,
                    hintText: widget.hintText,
                    hintStyle: midGreyTextStyle,
                    isDense: false,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    filled: true,
                    focusColor: kWhiteColor,
                    fillColor: kWhiteColor,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                      borderSide: BorderSide.none, // No border
                    ),
                  ),
                  maxLines: widget.minLines,
                  keyboardType: widget.textInputType,
                ),
        ],
      ),
    );
  }
}