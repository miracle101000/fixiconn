import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/theme/custom_theme.dart';
import '../utilities.dart';

class CustomTextField extends StatelessWidget {
  final CustomTheme theme;
  final bool hasSuffix;
  final bool isEmail;
  final String hintText;
  final int? maxLines;
  final String? suffixPath;
  final double? width;
  final bool? enabledBorder;
  final double? height;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTapSuffix;
  final EdgeInsets? contentPadding;
  final bool obscureText;
  final bool isPassword;
  final TextInputType? type;
  const CustomTextField(
      {super.key,
      this.maxLines,
      required this.theme,
      this.isPassword = false,
      this.suffixPath,
      this.onTapSuffix,
      this.type,
      this.hasSuffix = false,
      this.isEmail = false,
      this.enabledBorder,
      this.obscureText = false,
      this.width,
      this.height,
      this.controller,
      this.onSubmitted,
      this.onChanged,
      this.contentPadding,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? getWidth(342, context),
      constraints: BoxConstraints(maxHeight: height ?? 52, minHeight: 52),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: TextField(
          cursorColor: theme.enabledButtonColor,
          keyboardAppearance: theme.backgroundColor == Colors.white
              ? Brightness.light
              : Brightness.dark,
          keyboardType:
              isEmail ? TextInputType.emailAddress : type ?? TextInputType.text,
          controller: controller,
          style: isPassword && obscureText
              ? GoogleFonts.inter(color: const Color(0xff667085), fontSize: 14)
              : GoogleFonts.montserrat(color: theme.textColor, fontSize: 14),
          maxLines: maxLines,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          obscureText: obscureText,
          obscuringCharacter: "•",
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            hintStyle: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            contentPadding: hasSuffix
                ? const EdgeInsets.only(
                    top: 12, bottom: 12, left: 14, right: 14)
                : contentPadding,
            suffixIcon: hasSuffix
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onTapSuffix,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child:
                                Image.asset(suffixPath!, height: 16, width: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
            border: _textFieldBorder(const Color(0xffD0D5DD)),
            focusedBorder: _textFieldBorder(const Color(0xff003366)),
            enabledBorder: _textFieldBorder(const Color(0xffD0D5DD)),
          ),
        ),
      ),
    );
  }
}

_textFieldBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color));
}
