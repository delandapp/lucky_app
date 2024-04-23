import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bacadi/app/components/bookDetails.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 30,
                left: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back),
                      GestureDetector(
                        onTap: () => controller.addKoleksiBuku(),
                        child: Obx(
                          () => Icon(
                            Icons.add_link,
                            size: 30,
                            color: controller.detailBuku.value.koleksi == true
                                ? const Color(0xFF00D193)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9 - kBottomNavigationBarHeight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: MyBookDetails(
                      controller: controller,
                      dataBookDetails: state!.state1!,
                      dataUlasan: state.state2!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
