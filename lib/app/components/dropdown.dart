import 'dart:ffi';

import 'package:bacadi/app/modules/book/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDropdown extends StatelessWidget {
  MyDropdown({super.key});
  final BookController dropdownController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        hint: Text('Select Kategori'),
        onChanged: (value) {
          dropdownController.selectedValue(value);
          dropdownController.getDataKategori();
        },
        value: dropdownController.selectedValue.value == "" ? "" : dropdownController.selectedValue.value,
        items: dropdownController.listKategori.map((kategori) {
          return DropdownMenuItem<String>(
            value: kategori.namaKategori.toString(),
            child: Text(kategori.namaKategori.toString()),
          );
        }).toList(),
      ),
    );
  }
}
