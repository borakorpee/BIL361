import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/appHeader.dart';
import '../../components/customDrawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

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
          )
        ],
      ),
    );
  }
}
