// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/appHeader.dart';
import '../../components/customDrawer.dart';

class CancelRezervationScreen extends StatelessWidget {
  static const routeName = "/cancel-rez";
  const CancelRezervationScreen({super.key});

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
      body: Column(children: const [
        Header(),
        Text("cancel rez"),
      ]),
    );
  }
}
