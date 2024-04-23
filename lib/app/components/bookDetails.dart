import 'package:bacadi/app/data/models/response_ulasan.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bacadi/app/data/models/response_detailsbook.dart';

class MyBookDetails extends StatelessWidget {
  const MyBookDetails(
      {super.key,
      required this.dataBookDetails,
      required this.dataUlasan,
      required this.controller});
  final DataBookDetails dataBookDetails;
  final List<DataUlasan>? dataUlasan;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 190,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(dataBookDetails.coverBuku.toString()),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Text(dataBookDetails.judulBuku.toString(),
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w700)
                          .fontFamily,
                      fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.showMyPinjam();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE14892),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.01),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2,
                        vertical: MediaQuery.of(context).size.height * 0.009),
                  ),
                  child: Text(
                    'PINJAM',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontFamily:
                            GoogleFonts.baloo2(fontWeight: FontWeight.bold)
                                .fontFamily),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Penulis",
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                      .fontFamily,
                              fontSize: 17),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis),
                      Text("Penerbit",
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                      .fontFamily,
                              fontSize: 17),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataBookDetails.penulisBuku.toString(),
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                      .fontFamily,
                              fontSize: 17),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis),
                      Text(dataBookDetails.penerbitBuku.toString(),
                          style: TextStyle(
                              fontFamily:
                                  GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                      .fontFamily,
                              fontSize: 17),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => GestureDetector(
                          onTap: () => controller.addKoleksiBuku(),
                          child: FaIcon(
                              controller.detailBuku.value.koleksi == true
                                  ? FontAwesomeIcons.solidBookmark
                                  : FontAwesomeIcons.bookmark,
                              color: Colors.black)),
                    ),
                  )),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const ColoredBox(
              color: Colors.black,
              child: SizedBox(
                height: 2,
                width: double.infinity,
              )),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "Deskripsi",
              style: TextStyle(
                  fontFamily:
                      GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
                  fontSize: 20),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            dataBookDetails.deskripsi.toString(),
            style: TextStyle(
                fontFamily:
                    GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
                fontSize: 20),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          const ColoredBox(
              color: Colors.black,
              child: SizedBox(
                height: 2,
                width: double.infinity,
              )),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "Ulasan",
              style: TextStyle(
                  fontFamily:
                      GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
                  fontSize: 20),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ),
           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              TextFormField(
                                  validator:
                                      ValidationBuilder().minLength(5).build(),
                                  obscureText: false,
                                  autocorrect: false,
                                  controller: controller.ulasanController,
                                  autofocus: false,
                                  keyboardType: TextInputType.multiline,
                                  textAlign: TextAlign.left,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: 'Tuliskan pengalaman Anda',
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily),
                                    filled: true,
                                    fillColor: Colors.grey,
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(255, 255, 17, 0))),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(255, 255, 17, 0))),
                                    // border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 3)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 2)),
                                  )),
                              const SizedBox(height: 10),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Color(0xFF6500A1),
                                ),
                                onRatingUpdate: (rating) {
                                  // Kirim nilai rating ke server atau lakukan tindakan lain
                                  controller.ratingStar.value = rating;
                                },
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Obx(
                                  () => ElevatedButton(
                                    onPressed: () {
                                      // Aksi ketika tombol ditekan
                                      controller.addUlasan();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0XFF36969d),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery.of(context).size.width *
                                                0.2),
                                      ),
                                    ),
                                    child: controller.loading.value
                                        ? const CircularProgressIndicator()
                                        : Text(
                                            'Kirim',
                                            style: TextStyle(
                                                fontFamily: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w600)
                                                    .fontFamily,
                                                fontSize: 17),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
          const SizedBox(height: 20),
          buildUlasanList()
        ]),
      ),
    );
  }

  Widget buildUlasanList() {
    final width = MediaQuery.of(Get.context!).size.width;

    return dataUlasan!.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataUlasan!.length,
            itemBuilder: (context, index) {
              DataUlasan ulasan = dataUlasan![index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(140),
                          ),
                          child: Image.asset("assets/profil.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ulasan.username ?? '',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF000000),
                              fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBarIndicator(
                      direction: Axis.horizontal,
                      rating: dataBookDetails.rating!.toDouble(),
                      itemCount: 5,
                      itemSize: 18,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ulasan.ulasan ?? '',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 17.0),
                    ),
                  ],
                ),
              );
            },
          )
        : Container(
            width: width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF424242),
                width: 0.5,
              ),
            ),
            child: Text(
              'Belum ada ulasan buku',
              style: GoogleFonts.inriaSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          );
  }
}
