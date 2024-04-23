import 'package:bacadi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.offAllNamed(Routes.LOGIN);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Selamat Datang \n Di',
              style: TextStyle(fontSize: 30,fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily,color: const Color(0XFFDBA26C)),
            ),
            Image.asset("assets/logo.png",height: MediaQuery.of(context).size.height * 0.2,),
            Text(
              textAlign: TextAlign.center,
              'Baca.di',
              style: TextStyle(fontSize: 30,fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.normal).fontFamily,color: const Color(0XFFDBA26C)),
            ),
          ],
        ),
      ),
    );
  }
}
