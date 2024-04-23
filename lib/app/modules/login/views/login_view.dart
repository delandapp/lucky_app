import 'package:auto_size_text/auto_size_text.dart';
import 'package:bacadi/app/components/myButton.dart';
import 'package:bacadi/app/components/myInput.dart';
import 'package:bacadi/app/components/myJarak.dart';
import 'package:bacadi/app/data/constans/constans.dart';
import 'package:bacadi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthFullBody = MediaQuery.of(context).size.width;
    final heightFullBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: Form(
      key: controller.formKey,
      child: Container(
        color: kPrimaryLightColor,
        width: widthFullBody,
        height: heightFullBody,
        padding: EdgeInsets.symmetric(
            horizontal: widthFullBody * 0.15, vertical: heightFullBody * 0.02),
        child: Column(
          children: [
            const MyJarak(flex: 6),
            Image.asset(
              'assets/logo.png',
              width: widthFullBody * 0.3,
            ),
            const MyJarak(flex: 2),
            AutoSizeText(
              "Login",
              minFontSize: 20,
              maxFontSize: 27,
              style: TextStyle(
                  fontFamily:
                      GoogleFonts.inter(fontWeight: FontWeight.w900).fontFamily,
                  color: const Color(0xffDBA26C)),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const MyJarak(flex: 2),
            myInput(
              controller: controller,
              controllerField: controller.email,
              autoFocus: true,
              validator: controller.validator,
              hintText: "Masukkan Email",
              colorInput: 0xffE14892,
            ),
            const MyJarak(flex: 1),
            myInput(
              controller: controller,
              isPassword: true,
              controllerField: controller.password,
              validator: controller.validatorPassword,
              hintText: "Masukkan Password",
              colorInput: 0xffE14892,
            ),
            const MyJarak(flex: 2),
            MyButton(
                widthFullBody: widthFullBody,
                label: "Login",
                width: widthFullBody * 0.2,
                height: heightFullBody * 0.04,
                onTap: () => controller.login(),
                controller: controller),
            const MyJarak(flex: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Dont Have An Account? ",
                  minFontSize: 12,
                  maxFontSize: 17,
                  style: TextStyle(
                      fontFamily: GoogleFonts.inter(fontWeight: FontWeight.w500)
                          .fontFamily,
                      color: const Color(0xffDBA26C)),
                  maxLines: 1,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.REGISTER),
                  child: AutoSizeText(
                    "Register",
                    minFontSize: 12,
                    maxFontSize: 17,
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.inter(fontWeight: FontWeight.w900)
                                .fontFamily,
                        color: kPrimaryColor),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
