import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/constans/constans.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({
    super.key,
    required this.widthFullBody,
    required this.title,
    this.titleCenter,
    this.height = kToolbarHeight
  });

  final double height;
  final double widthFullBody;
  final String title;
  final bool? titleCenter;

  @override
  Size get preferredSize => Size.fromHeight(height);
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: kPrimaryColor,
      centerTitle: titleCenter ?? false,
      title: AutoSizeText(
        title,
        style: TextStyle(fontSize: widthFullBody * 0.02,fontFamily: GoogleFonts.inika().fontFamily,fontWeight: FontWeight.bold),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }

}