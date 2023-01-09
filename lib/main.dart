import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yga/providers/client_provider.dart';
import 'package:yga/screens/cart/cart_page.dart';
import 'package:yga/screens/deposit/deposit_page.dart';
import 'package:yga/screens/home/home_page.dart';
import 'package:yga/screens/reservation/cancelRez_page.dart';
import 'package:yga/screens/reservation/reservation_page.dart';

import 'screens/login/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ClientProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: const LoginScreen(),
          routes: {
            DepositScreen.routeName: ((context) => const DepositScreen()),
            LoginScreen.routeName: ((context) => const LoginScreen()),
            HomeScreen.routeName: (context) => const HomeScreen(),
            ReservationScree.routeName: (context) => const ReservationScree(),
            CancelRezervationScreen.routeName: (context) =>
                const CancelRezervationScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
          },
        );
      },
    );
  }
}
