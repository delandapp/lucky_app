import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/constans/constans.dart';

class myInput extends StatelessWidget {
  const myInput(
      {super.key,
      required this.controller,
      required this.controllerField,
      this.prefixIcon,
      required this.hintText,
      this.isPassword = false,
      this.autoFocus = false,
      this.colorInput = 0xffFFFFFF,
      this.validator});
  final controller;
  final TextEditingController controllerField;
  final validator;
  final IconData? prefixIcon;
  final bool isPassword;
  final bool autoFocus;
  final String hintText;
  final int colorInput;

  @override
  Widget build(BuildContext context) {
    return isPassword
        ? Obx(() => TextFormField(
            validator: validator,
            controller: controllerField,
            obscureText: controller.isObsure.value,
            autofocus: autoFocus,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
            decoration: InputDecoration(
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.isObsure.value = !controller.isObsure.value;
                    },
                    child: FaIcon(
                      size: 18,
                      (controller.isObsure.value) == true
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily),
              filled: true,
              fillColor: Color(colorInput),
              errorStyle: const TextStyle(
                color: errorInputColor,
              ),
              errorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: errorInputColor)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: errorInputColor,width: 2)),
              // border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide:
                      const BorderSide(color: focusInputColor, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: enableInputColor)),
            )))
        : TextFormField(
            validator: validator,
            controller: controllerField,
            autofocus: true,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
            decoration: InputDecoration(
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    size: 18,
                    prefixIcon,
                    color: Colors.black,
                  ),
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily),
              filled: true,
              fillColor: Color(colorInput),
              errorStyle: const TextStyle(
                color: errorInputColor,
              ),
              errorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: errorInputColor)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: errorInputColor,width: 2)),
              // border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide:
                      const BorderSide(color: focusInputColor, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: enableInputColor)),
            ));
  }
}
