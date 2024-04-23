import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  var tabIndex = 0;
  final namePage = "Home Page".obs;

  void changeTabIndex(int index) {
    
    if (index == 0) {
      namePage.value = "Home Page";
    } else if (index == 1) {
      namePage.value = "Book Page";
    } else if (index == 2) {
      namePage.value = "Bookmark Page";
    } else if (index == 3) {
      namePage.value = "Profil Page";
    }
    tabIndex = index;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
