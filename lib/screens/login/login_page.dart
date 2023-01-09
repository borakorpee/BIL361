// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yga/providers/client_provider.dart';
import 'package:yga/providers/meal_list_provider.dart';
import 'package:yga/screens/home/home_page.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(211, 214, 221, 1),
      body: SafeArea(
        child: SizedBox(
          width: 414.w,
          height: 896.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Content(),
              SizedBox(height: 30.h),
              const InputFields(),
            ],
          ),
        ),
      ),
    );
  }
}

class InputFields extends StatefulWidget {
  const InputFields({
    Key? key,
  }) : super(key: key);

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  TextEditingController username_controlller = TextEditingController();

  TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372.w,
      height: 300.h,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Lütfen oturum açın",
                style: TextStyle(
                  color: const Color(0xff666666),
                  fontWeight: FontWeight.w100,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "Kullanıcı Adı:",
              style: TextStyle(
                color: const Color(0xff666666),
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10).r,
              child: SizedBox(
                height: 35.h,
                child: TextFormField(
                  controller: username_controlller,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.people,
                      color: Color(0xff666666),
                    ),
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
            ),
            Text(
              "Parola:",
              style: TextStyle(
                color: const Color(0xff666666),
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10).r,
              child: SizedBox(
                height: 35.h,
                child: TextFormField(
                  controller: password_controller,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff666666),
                    ),
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
            ),
            SizedBox(height: 10.h),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (() async {
                    var response = await http.post(
                      Uri.parse(
                        "http://localhost:3001/api/client/login",
                      ),
                      body: {
                        "no": username_controlller.text,
                        "pass": password_controller.text,
                      },
                    );
                    var data = jsonDecode(response.body);
                    if (data["status"]) {
                      Provider.of<ClientProvider>(context, listen: false)
                          .setClient(data);

                      var responsee = await http.get(
                          Uri.parse("http://localhost:3001/api/yemek/yemeks"),
                          headers: {
                            "x-access-token": data["token"],
                          });
                      var dataa = jsonDecode(responsee.body);
                      Provider.of<MealListProvider>(context, listen: false)
                          .setMeals(dataa);
                      Navigator.of(context)
                          .popAndPushNamed(HomeScreen.routeName);
                    }
                  }),
                  child: Container(
                    width: 90.w,
                    height: 34.h,
                    color: const Color(0xff3c8dbc),
                    child: const Center(
                        child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60).r,
      child: Column(
        children: [
          SizedBox(
            width: 290.w,
            height: 121.h,
            child: Text(
              "Bakırçay Üniversitesi",
              style: TextStyle(
                color: const Color(0xff424242),
                height: 1.4,
                fontSize: 45.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Turnike ve Yemekhane Sistemi",
            style: TextStyle(
              color: const Color(0xff424242),
              height: 1.4,
              fontSize: 22.sp,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Container(
            width: 150.w,
            height: 150.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  "https://yks.bakircay.edu.tr/img/25005437_321397395010949_4767214854459097088_n.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
