import 'dart:convert';

import 'package:bacadi/app/data/models/response_bukukategori.dart';
import 'package:bacadi/app/data/models/response_kategori.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:bacadi/app/data/constans/endpoint.dart';
import 'package:bacadi/app/data/models/response_buku.dart';
import 'package:bacadi/app/data/models/response_bookSearch.dart';
import 'package:bacadi/app/data/provider/api_provider.dart';
import 'package:bacadi/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BookController extends GetxController with StateMixin<List<DataBuku>> {
  //TODO: Implement BookController
  final validator = ValidationBuilder().minLength(1).build();
  final TextEditingController search = TextEditingController();
  final RxString username = StorageProvider.read(StorageKey.username).obs;
  final RxInt currentPage = 0.obs;
  final RxInt searchLenght = 0.obs;
  final RxBool loading = false.obs;
  final RxString selectedValue = "".obs;
  final RxList<DataKategori> listKategori= <DataKategori>[].obs;
  final RxList<DataBukuKategori> dataBukuKategori = <DataBukuKategori>[].obs;
  RxList<String> listKategoriStrings = <String>[].obs;
  RxList<Map<String, String>> splashData = [
    {
      "image": "splash-1.png",
    },
    {
      "image": "splash-1.png",
    },
    {
      "image": "splash-1.png",
    },
  ].obs;
  final RxList<DataBukuSearch> listDataBuku = <DataBukuSearch>[].obs;

  @override
  void onInit() {
    getData();
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

  Future<void> getDataKategori() async {
    loading.value = true;

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final response = await ApiProvider.instance().get(
          '${Endpoint.book}/kategori/${selectedValue.value}',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        selectedValue.value != ""
              ? searchLenght.value = 3
              : searchLenght.value = 0;
        final ResponseBukukategori responseBukukategori =
            ResponseBukukategori.fromJson(response.data);
            loading.value = false;
        if (responseBukukategori.data!.isEmpty) {
          dataBukuKategori.value = [];
        } else {
          dataBukuKategori.value = responseBukukategori.data!;
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> searchData(String value) async {
    try {
      if (search.text.toString() == "") {
        listDataBuku.value = [];
        searchLenght.value = 0;
        return;
      }
      String data = jsonEncode({
        "query": search.text.toString(),
      });
      search.text.toString() != ""
              ? searchLenght.value = 1
              : searchLenght.value = 0;
      loading.value = true;
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final response = await ApiProvider.instance().post(
          "${Endpoint.book}/search",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}),
          data: data);
      if (response.statusCode == 200) {
        loading.value = false;
        final ResponseBookSearch responseBook =
            ResponseBookSearch.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          listDataBuku.value = [];
        } else {
          listDataBuku.value = responseBook.data!;
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final responseKategori = await ApiProvider.instance().get(Endpoint.kategori,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      final response = await ApiProvider.instance().get(Endpoint.book,
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        final ResponseBuku responseBook = ResponseBuku.fromJson(response.data);
        final ResponseKategori responseKategoriData = ResponseKategori.fromJson(responseKategori.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          listKategori.value = responseKategoriData.data!;
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  String sapaanBerdasarkanWaktu() {
    var jam = DateTime.now().hour;
    if (jam >= 4 && jam < 10) {
      return 'Selamat Pagi';
    } else if (jam >= 10 && jam < 15) {
      return 'Selamat Siang';
    } else if (jam >= 15 && jam < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }
}
