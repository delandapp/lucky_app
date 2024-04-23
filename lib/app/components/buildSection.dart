import 'package:bacadi/app/components/starRating.dart';
import 'package:bacadi/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:bacadi/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

class buildSection extends StatelessWidget {
  const buildSection({
    super.key,
    required this.data,
  });

  final DataBuku data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.kategoriBuku.toString(),
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: GoogleFonts.poppins(
                        fontWeight: FontWeight.w900,
                      ).fontFamily,
                      fontSize: 16.0,
                      color: const Color(0xff09142E),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => null,
                child: Text(
                  "See all >>",
                  style: TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.w900,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 15.0,
                    color: const Color(0xFFE84218),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.26,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: data.buku!
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : e.bukuID.toString()}),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                color: const Color(0xFFFFFFFF),
                                width: MediaQuery.of(context).size.width * 0.34,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 20,
                                      child: Image.network(
                                        e.coverBuku.toString(),
                                        fit: BoxFit.fill,
                                        width: MediaQuery.of(context).size.width *
                                            0.34,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * 0.3,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        e.judul.toString(),
                                        style: TextStyle(
                                          height: 1.2,
                                          fontWeight: FontWeight.w900,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 14.0,
                                          color: const Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Expanded(
                                            flex: 4, child: SizedBox()),
                                        Column(
                                          children: [
                                            Text(
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              "By : ${e.penulis.toString()}",
                                              style: TextStyle(
                                                height: 1.2,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: GoogleFonts.poppins()
                                                    .fontFamily,
                                                fontSize: 10.0,
                                                color: const Color(0xFF000000),
                                              ),
                                            ),
                                            StarRating(
                                              rating: e.rating!.toDouble(),
                                              starSize: 12,
                                            )
                                          ],
                                        ),
                                        const Expanded(
                                            flex: 1, child: SizedBox()),
                                        const Icon(Icons.bookmark)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
