// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../components/appHeader.dart';
import '../../components/customDrawer.dart';
import '../../providers/client_provider.dart';
import '../../providers/meal_list_provider.dart';
import '../login/constant.dart';

class CancelRezervationScreen extends StatelessWidget {
  static const routeName = "/cancel-rez";
  const CancelRezervationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<MealListProvider>(context);
    final client = Provider.of<ClientProvider>(context);

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
      body: Column(children: [
        const Header(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataRowHeight: 90.h,
            dataRowColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
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
                  "Yemek Tarihi",
                ),
              ),
              DataColumn(
                label: Text(
                  "Yemekhane",
                ),
              ),
              DataColumn(
                label: Text("Öğün"),
              ),
              DataColumn(
                label: Text("Fiyat"),
              ),
              DataColumn(
                label: Text("Sil"),
              ),
            ],
            rows: cart.ownedMeals!
                .map(
                  (meal) => DataRow(
                    cells: [
                      DataCell(
                        Text(meal.date.toString()),
                      ),
                      DataCell(
                        Text(meal.yemekhane.toString()),
                      ),
                      DataCell(
                        Row(
                          children: [
                            Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://yks.bakircay.edu.tr/img/ogun/O.png"),
                                ),
                              ),
                            ),
                            Text(meal.ogun.toString()),
                          ],
                        ),
                      ),
                      DataCell(
                        Text("${meal.fiyat} TL"),
                      ),
                      DataCell(GestureDetector(
                        onTap: () async {
                          cart.removeFromOwned(meal);
                          cart.addMeal(meal);
                          client.updateBalance(7);
                          var response = await http.put(
                              Uri.parse(
                                  "$root/client/update/${client.get_client!.sId}"),
                              body: {
                                "bakiye": client.get_client!.bakiye,
                              },
                              headers: {
                                "x-access-token": client.get_token,
                              });
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ]),
    );
  }
}
