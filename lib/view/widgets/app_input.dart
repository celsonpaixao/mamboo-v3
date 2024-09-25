import 'package:flutter/material.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';

class AppInput extends StatelessWidget {
  final TextInputType type;
  final String? label;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? sufixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int? maxLength;

  const AppInput({
    super.key,
    required this.type,
    this.label,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.textInputAction,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.sufixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final borderTyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.white, width: 1),
    );
    final errorBorderTyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: secondary500, width: 1),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          AppText(
            text: label!,
            style: AppTextStyle.p_bold,
          ),
        if (label != null)
          const AppVerticalSpacing(
            values: 5,
          ),
        TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          onChanged: onChanged,
          validator: validator,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.all(12),
            fillColor: Colors.white.withOpacity(0.3),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.white,
            suffixIconColor: Colors.white,
            hintText: hintText,
            suffixIcon: sufixIcon,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            focusedBorder: borderTyle,
            disabledBorder: borderTyle,
            enabledBorder: borderTyle,
            errorBorder: borderTyle,
            focusedErrorBorder: borderTyle,
            border: borderTyle,
            errorStyle: const TextStyle(color: Colors.white),
          ),
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
