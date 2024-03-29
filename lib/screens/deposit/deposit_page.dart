import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:yga/screens/login/constant.dart';
import '../../components/appHeader.dart';
import '../../components/customDrawer.dart';
import '../../providers/client_provider.dart';

class DepositScreen extends StatefulWidget {
  static const routeName = "/deposit";
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  int deposit = 0;
  void handleClick(int tutar) {
    setState(() {
      deposit = tutar;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClientProvider>(context, listen: false);

    TextEditingController depositController =
        TextEditingController(text: deposit.toString());
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
            SizedBox(height: 20.h),
            Text(
              "Kartınıza Bakiye Yükleyin",
              style: TextStyle(color: Colors.red, fontSize: 25.sp),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 250.w,
              height: 400.h,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  crossAxisCount: 3,
                ),
                itemCount: fiyat.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => handleClick(fiyat[index]),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: const Color(0xff4CAF50),
                        ),
                        child: Center(
                            child: Text(
                          "${fiyat[index]} TL",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ))),
                  );
                },
              ),
            ),
            SizedBox(
              width: 250.w,
              height: 50.h,
              child: TextFormField(
                controller: depositController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 0, left: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () async {
                provider.updateBalance(int.tryParse(depositController.text));
                var response = await http.put(
                    Uri.parse(
                        "$root/client/update/${provider.get_client!.sId}"),
                    body: {
                      "bakiye": provider.get_client!.bakiye,
                    },
                    headers: {
                      "x-access-token": provider.get_token,
                    });

                log(response.body);
              },
              child: Container(
                width: 80.w,
                height: 47.h,
                decoration: BoxDecoration(
                    color: const Color(0xff568def),
                    border: Border.all(color: Colors.grey)),
                child: const Center(child: Text("İleri")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<int> fiyat = [5, 10, 15, 20, 25, 30, 40, 50, 60, 70, 80, 100];
