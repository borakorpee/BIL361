import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yga/components/appHeader.dart';

import '../../components/customDrawer.dart';
import '../../providers/qr_provider.dart';

class QrHistory extends StatefulWidget {
  static const routeName = "/qr-history";
  const QrHistory({super.key});

  @override
  State<QrHistory> createState() => _QrHistoryState();
}

class _QrHistoryState extends State<QrHistory> {
  @override
  Widget build(BuildContext context) {
    final qr_provider = Provider.of<QrProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  " SKS",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w200),
                )
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Okul GİRİŞ/ÇIKIŞ",
                ),
                Tab(
                  text: "Yemekhane GİRİŞ/ÇIKIŞ",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        dataRowHeight: 90.h,
                        dataRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        showBottomBorder: true,
                        columnSpacing: 35.r,
                        headingTextStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        columns: const [
                          DataColumn(
                            label: Text(
                              "Statü",
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Saat",
                            ),
                          ),
                        ],
                        rows: qr_provider.okul
                            .map(
                              (e) => DataRow(
                                color: e.status == "giriş"
                                    ? MaterialStateProperty.all(Colors.green)
                                    : MaterialStateProperty.all(Colors.red),
                                cells: [
                                  DataCell(
                                    Text(e.status.toString()),
                                  ),
                                  DataCell(
                                    Text(e.datetime.toString()),
                                  )
                                ],
                              ),
                            )
                            .toList()),
                  ),
                ],
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        dataRowHeight: 90.h,
                        dataRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        showBottomBorder: true,
                        columnSpacing: 35.r,
                        headingTextStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        columns: const [
                          DataColumn(
                            label: Text(
                              "Statü",
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Saat",
                            ),
                          ),
                        ],
                        rows: qr_provider.yemekhane
                            .map(
                              (e) => DataRow(
                                color: e.status == "giriş"
                                    ? MaterialStateProperty.all(Colors.green)
                                    : MaterialStateProperty.all(Colors.red),
                                cells: [
                                  DataCell(
                                    Text(e.status.toString()),
                                  ),
                                  DataCell(
                                    Text(e.datetime.toString()),
                                  )
                                ],
                              ),
                            )
                            .toList()),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
