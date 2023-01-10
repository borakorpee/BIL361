import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yga/screens/cart/cart_page.dart';

import '../../components/appHeader.dart';
import '../../components/customDrawer.dart';
import '../../providers/meal_list_provider.dart';

class ReservationScree extends StatelessWidget {
  static const routeName = "/reservation";
  const ReservationScree({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<MealListProvider>(context, listen: false).meal_list;
    final cart = Provider.of<MealListProvider>(context);
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
              width: double.infinity,
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
                rows: provider!
                    .map(
                      (meal) => DataRow(
                        selected: cart.cartList!.contains(meal),
                        onSelectChanged: (value) {
                          if (value!) {
                            cart.addToCart(meal);
                          } else {
                            cart.removeFromCart(meal);
                          }
                        },
                        cells: [
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
                                Text(meal.date.toString()),
                              ],
                            ),
                          ),
                          DataCell(
                            Text(meal.yemekhane.toString()),
                          ),
                          DataCell(
                            SizedBox(
                              width: 100.w,
                              height: 100.h,
                              child: ListView.builder(
                                itemCount: meal.men!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 5).r,
                                    child: Text(
                                      meal.men![index],
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          DataCell(
                            Text(meal.ogun.toString()),
                          ),
                          DataCell(
                            Text("${meal.fiyat} TL"),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  child: Container(
                    width: 177.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: const Color(0xff3c8dbc),
                    ),
                    child: const Center(
                      child: Text(
                        "İleri",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
