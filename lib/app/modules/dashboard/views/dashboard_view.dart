import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bacadi/app/modules/book/views/book_view.dart';
import 'package:bacadi/app/modules/bookmark/views/bookmark_view.dart';
import 'package:bacadi/app/modules/home/views/home_view.dart';
import 'package:bacadi/app/modules/profil/views/profil_view.dart';
import 'package:bacadi/app/components/customBarMaterial.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFfE14892),
            centerTitle: true,
            leading: Image.asset("assets/logo-bg.png",width: 40,),
            title: Obx(() => Text(controller.namePage.value)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 25),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CustomBottomBarMaterial(
                    onTap: controller.changeTabIndex,
                    currentIndex: controller.tabIndex,
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: SafeArea(
              child: Center(
                  child: IndexedStack(
                index: controller.tabIndex,
                children: const [
                  HomeView(),
                  BookView(),
                  BookmarkView(),
                  ProfilView(),
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}
