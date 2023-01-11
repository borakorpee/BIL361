import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:yga/models/client_model.dart';
import 'package:yga/models/qr_singleton.dart';
import 'package:yga/providers/meal_list_provider.dart';
import 'package:yga/providers/qr_provider.dart';
import '../../components/appHeader.dart';
import '../../components/customDrawer.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../providers/client_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showOkul = false;
  bool showYemekhane = false;
  late QrSingleton qr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();

    qr = QrSingleton.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final client = Provider.of<ClientProvider>(context, listen: false);
    final qr_provider = Provider.of<QrProvider>(context);
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: const Color(0xffecf0f5),
            child: Column(
              children: [
                const Header(),
                SizedBox(height: 20.h),
                Container(
                  color: const Color(0xffecf0f5),
                  child: Container(
                    width: 335.w,
                    height: 160.h,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15).r,
                      child: Text(
                        "Bakirçay Üniversitesi Turnike ve Yemekhane Sistemi mobil uygulamasına hoş geldiniz. Yandaki menüden ilgili adımları takip ederek işlemlerinizi yapabilirsiniz.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          showOkul = !showOkul;
                          showYemekhane = false;
                        });
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
                                  Icons.qr_code,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Okul GİRİŞ/ÇIKIŞ",
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
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          showYemekhane = !showYemekhane;
                          showOkul = false;
                        });
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
                                  Icons.qr_code,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Yemekhane GİRİŞ/ÇIKIŞ",
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
                  ],
                ),
                showOkul
                    ? Column(
                        children: [
                          const Text(
                            "Okul GİRİŞ/ÇIKIŞ işlemi için kullanabileceğiniz QR kod",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            child: qr.schoolQR(client.get_client),
                          ),
                          TextButton(
                            onPressed: (() {
                              DateTime now = DateTime.now();
                              String formattedDate =
                                  DateFormat('dd MMMM EEEE , h:mm:ss ', "tr")
                                      .format(now);
                              qr_provider.okul_kayit(formattedDate);
                            }),
                            child: const Text("Okut"),
                          )
                        ],
                      )
                    : const SizedBox(),
                showYemekhane
                    ? Column(
                        children: [
                          const Text(
                            "Yemekhane GİRİŞ/ÇIKIŞ işlemi için kullanabileceğiniz QR kod",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            child: qr.cafeteriaQR(client.get_client),
                          ),
                          TextButton(
                            onPressed: (() {
                              DateTime now = DateTime.now();
                              String formattedDate =
                                  DateFormat('dd MMMM EEEE , h:mm:ss ', "tr")
                                      .format(now);
                              qr_provider.yemekhane_kayit(formattedDate);
                            }),
                            child: const Text("Okut"),
                          )
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: 71.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xffd2d6de),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "Copyright © 2018 ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: " Bakırçay Üniversitesi",
                          style: TextStyle(
                              color: Color(0xff3c8dbc),
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: " Sağlık Kültür ve Spor Daire Başkanlığı",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
