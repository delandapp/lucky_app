import 'package:bacadi/app/components/bookSearch.dart';
import 'package:bacadi/app/components/buildSearch.dart';
import 'package:bacadi/app/components/dropdown.dart';
import 'package:bacadi/app/components/kategoriBuild.dart';
import 'package:bacadi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:bacadi/app/components/searchInput.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: controller.obx(
        (state) => Container(
          color: const Color(0xFFFFFFFF),
          width: widthFullBody,
          height: heightFullBody,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      width: widthFullBody * 0.4,
                      child: ElevatedButton(
                        onPressed: () => {Get.toNamed(Routes.HISTORY)},
                        child: Text("Riwayat Pinjam"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFDEA06C)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDEA06C),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                        height: 40,
                        width: widthFullBody * 0.4,
                        child: MyDropdown()),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInputSearch(
                  prefixIcon: Icons.search,
                  validator: controller.validator,
                  controller: controller,
                  controllerField: controller.search,
                  height: 20,
                  width: 10,
                  hintText: "Search Your Favorit Book",
                  autoFocus: false,
                ),
              ),
              Obx(
                () => Expanded(
                  child: controller.searchLenght.value > 1
                      ? controller.loading.value == false
                          ? controller.searchLenght.value == 3
                              ? controller.dataBukuKategori.isEmpty
                                  ? const Center(
                                      child: Text("Tidak Ada Buku Kategori"))
                                  : BukuKategori(data: controller.dataBukuKategori)
                              : controller.listDataBuku.isEmpty
                                  ? const Center(child: Text("Tidak Ada Buku"))
                                  : BookSearch(data: controller.listDataBuku)
                          : const Center(child: CircularProgressIndicator())
                      : buildSearch(data: state!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
