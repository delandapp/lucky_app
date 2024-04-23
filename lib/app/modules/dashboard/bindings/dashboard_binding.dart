import 'package:get/get.dart';
import 'package:bacadi/app/modules/book/controllers/book_controller.dart';
import 'package:bacadi/app/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:bacadi/app/modules/home/controllers/home_controller.dart';
import 'package:bacadi/app/modules/profil/controllers/profil_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BookController>(
      () => BookController(),
    );
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
  }
}
