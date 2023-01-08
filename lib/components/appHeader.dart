// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
      ],
    );
  }
}
