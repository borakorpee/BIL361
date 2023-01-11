import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../components/appHeader.dart';
import '../../components/customDrawer.dart';
import '../../providers/client_provider.dart';
import '../../providers/meal_list_provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../login/constant.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    final client = Provider.of<ClientProvider>(context).get_client;
    final clientt = Provider.of<ClientProvider>(context);

    final cart = Provider.of<MealListProvider>(context);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy EEEE', "tr").format(now);
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
      body: Column(
        children: [
          const Header(),
          Container(
            width: 384.w,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10).r,
              child: Text(
                "Sepetim",
                style:
                    TextStyle(fontSize: 25.sp, color: const Color(0xff444444)),
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
              columns: const [
                DataColumn(
                  label: Text("Öğün"),
                ),
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
                  label: Text("Fiyat"),
                ),
                DataColumn(
                  label: Text("Sil"),
                ),
              ],
              rows: cart.cartList!
                  .map(
                    (meal) => DataRow(
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
                              Text(meal.ogun.toString()),
                            ],
                          ),
                        ),
                        DataCell(
                          Text(meal.date.toString()),
                        ),
                        DataCell(
                          Text(meal.yemekhane.toString()),
                        ),
                        DataCell(
                          Text("${meal.fiyat} TL"),
                        ),
                        DataCell(GestureDetector(
                          onTap: () {
                            cart.removeFromCart(meal);
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
          SizedBox(height: 10.h),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 384.w,
                  height: 170.h,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15.w),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Sipariş Tarihi: ${formattedDate}",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 354.w,
                        height: 113.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 231.w,
                                    child: const Text(
                                      "Mevcut Bakiye:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text("${client!.bakiye.toString()} TL"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 231.w,
                                    child: const Text(
                                      "Harcanan:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text("${cart.cartList!.length * 7} TL"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 231.w,
                                    child: const Text(
                                      "Kalan:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                      "${(int.parse(client.bakiye as String) - cart.cartList!.length * 7)} TL"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        cart.clearCart();
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xff3c8dbc),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 13)
                              .r,
                          child: FittedBox(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Sepeti Boşalt",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    GestureDetector(
                      onTap: () async {
                        if (int.parse(client.bakiye as String) >
                            cart.cartList!.length * 7) {
                          clientt.proceedCheckOut(
                            (int.parse(client.bakiye as String) -
                                cart.cartList!.length * 7),
                          );
                          var response = await http.put(
                              Uri.parse("$root/client/update/${client.sId}"),
                              body: {
                                "bakiye": client.bakiye,
                              },
                              headers: {
                                "x-access-token": clientt.get_token,
                              });
                          for (var meal in cart.cartList!) {
                            if (!cart.ownedMeals!.contains(meal)) {
                              cart.ownedMeals!.add(meal);
                            }
                          }
                          cart.setas();
                          cart.clearCart();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Yetersiz Bakiye")));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xff00a65a),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 13)
                              .r,
                          child: FittedBox(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Bakiye ile Ödeme Yap",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
