import 'package:bacadi/app/data/models/response_bookSearch.dart';
import 'package:flutter/material.dart';
import 'package:bacadi/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookSearch extends StatelessWidget {
  const BookSearch({
    super.key,
    required this.data,
  });

  final List<DataBukuSearch> data;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 3.5, mainAxisSpacing: 10, crossAxisSpacing: 20),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : data[index].bukuID.toString()}),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(data[index].coverBuku.toString()), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 140,
                    width: 100,
                    child: Image.network(data[index].coverBuku.toString(),
                        fit: BoxFit.fill),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Color(0xFFDBCCDD),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      data[index].judul.toString(),
                                      style: TextStyle(
                                          fontFamily: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold)
                                              .fontFamily),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(data[index].penerbit.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                        "By ${data[index].penulis.toString()}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Text(
                                        data[index].tahunTerbit.toString(),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold)
                                                .fontFamily),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFDEA06C),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                "PINJAM",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold)
                                        .fontFamily,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}