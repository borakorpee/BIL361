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
              SizedBox(width: 10.w),
              SizedBox(
                width: 44.w,
                height: 50.h,
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Positioned(
                      top: 8.h,
                      right: 6.r,
                      child: Container(
                        width: 15.w,
                        height: 15.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            "7",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
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
