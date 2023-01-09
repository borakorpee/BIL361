import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/appHeader.dart';
import '../../components/customDrawer.dart';

class ReservationScree extends StatelessWidget {
  static const routeName = "/reservation";
  const ReservationScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.house,
            color: Colors.transparent,
          ),
          Icon(
            Icons.house,
            color: Colors.transparent,
          )
        ],
        backgroundColor: const Color(0xff367fa9),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BAKIRÇAY",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            Text(
              " SKS",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
      body: Container(
        color: const Color(0xffecf0f5),
        child: Column(
          children: [
            const Header(),
            Container(
              width: 384.w,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10).r,
                child: Text(
                  "Seçilebilecek Yemekler",
                  style: TextStyle(
                      fontSize: 25.sp, color: const Color(0xff444444)),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                showBottomBorder: true,
                columnSpacing: 15.r,
                headingTextStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                showCheckboxColumn: true,
                columns: const [
                  DataColumn(
                    label: Text(
                      "Yemek Tarihi",
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Yemekhane",
                    ),
                  ),
                  DataColumn(
                    label: Text("Menü"),
                  ),
                  DataColumn(
                    label: Text("Öğün"),
                  ),
                  DataColumn(
                    label: Text("Fiyat"),
                  ),
                ],
                rows: [
                  DataRow(
                    selected: false,
                    onSelectChanged: (b) {},
                    cells: const [
                      DataCell(
                        Text("asd"),
                      ),
                      DataCell(
                        Text("asd"),
                      ),
                      DataCell(
                        Text("asd"),
                      ),
                      DataCell(
                        Text("asd"),
                      ),
                      DataCell(
                        Text("asd"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
