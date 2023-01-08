import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yga/screens/deposit/deposit_page.dart';
import 'package:yga/screens/login/login_page.dart';

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
            const Text(
              " SKS",
              style: TextStyle(fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
      body: Column(children: [
        Container(
          color: const Color(0xff3c8dbc),
          width: 414.w,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.currency_lira_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  Text(
                    "10,5",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              SizedBox(width: 25.w),
              const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 25.w),
              SizedBox(
                width: 25.w,
                height: 25.w,
                child: Image.network("https://yks.bakircay.edu.tr/img/O.png"),
              ),
              SizedBox(width: 25.w),
            ],
          ),
        ),
      ]),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        backgroundColor: const Color(0xff222d32),
        child: ListView(
          children: [
            SizedBox(
              width: 230.w,
              height: 100.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20).r,
                child: Row(
                  children: [
                    SizedBox(
                      width: 45.w,
                      height: 45.w,
                      child: Image.network(
                          "https://yks.bakircay.edu.tr/img/O.png"),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "BORA KÖRPE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Container(
                              width: 10.w,
                              height: 10.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                            ),
                            SizedBox(width: 5.w),
                            const Text(
                              "Çevrimiçi",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 230.w,
              height: 37,
              color: const Color(0xff1a2226),
              child: Padding(
                padding: const EdgeInsets.only(left: 20).r,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Menü",
                      style: TextStyle(color: Color(0xff4b646f), fontSize: 12),
                    )),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).popAndPushNamed(DepositScreen.routeName);
              },
              leading: const Icon(
                Icons.home,
                color: Color(0xffb8c7ce),
              ),
              title: const Text(
                "Anasayfa",
                style: TextStyle(color: Color(0xffb8c7ce)),
              ),
            ),
            ListTile(
              onTap: (() {
                Navigator.of(context).pop();
                Navigator.of(context).popAndPushNamed(DepositScreen.routeName);
              }),
              leading: const Icon(
                Icons.currency_lira_rounded,
                color: Color(0xffb8c7ce),
              ),
              title: const Text(
                "Bakiye Yükle",
                style: TextStyle(color: Color(0xffb8c7ce)),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Color(0xffb8c7ce),
              ),
              title: Text(
                "Yemek Rezervasyon",
                style: TextStyle(color: Color(0xffb8c7ce)),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.remove_circle,
                color: Color(0xffb8c7ce),
              ),
              title: Text(
                "Rezervasyon İptal",
                style: TextStyle(color: Color(0xffb8c7ce)),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.shopping_cart_sharp,
                color: Color(0xffb8c7ce),
              ),
              title: Text(
                "Sepetim",
                style: TextStyle(color: Color(0xffb8c7ce)),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
              },
              leading: const Icon(
                Icons.close,
                color: Color(0xffb8c7ce),
              ),
              title: const Text(
                "Çıkış Yap",
                style: TextStyle(color: Color(0xffb8c7ce)),
              ),
            ),
          ],
        ));
  }
}
