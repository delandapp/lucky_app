import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bacadi/app/components/buildSection.dart';
import 'package:bacadi/app/components/newBook.dart';
import 'package:bacadi/app/components/popularBook.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xFFF2F2F2)),
        // width: widthFullBody,
        child: controller.obx(
          (state) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.03),
                  child: SizedBox(height: heightFullBody * 0.34, child: PopularBook(dataBookPopular: state!.state2!)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.03),
                  child: SizedBox(height: heightFullBody * 0.34, child: NewBook(dataBookNew: state.state1!)),
                ),
                Column(
                  children: state.state3!.map((data) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.03),
                      child: SizedBox(
                        width: widthFullBody,
                        height: heightFullBody * 0.34,
                        child: buildSection(data: data),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
