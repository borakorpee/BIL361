import 'package:flutter/material.dart';

class QrProvider with ChangeNotifier {
  List<qrmodel> _okul = [];
  List<qrmodel> _yemekhane = [];

  List<qrmodel> get okul => List.from(_okul.reversed);
  List<qrmodel> get yemekhane => List.from(_yemekhane.reversed);

  String? lastokul = "çıkış";
  String? lastyemekhane = "çıkış";

  void okul_kayit(String datetime) {
    if (lastokul == "çıkış") {
      qrmodel ekle = qrmodel(status: "giriş", datetime: datetime);
      _okul.add(ekle);
      lastokul = "giriş";
    } else if (lastokul == "giriş") {
      qrmodel ekle = qrmodel(status: "çıkış", datetime: datetime);
      _okul.add(ekle);
      lastokul = "çıkış";
    }
    notifyListeners();
  }

  void yemekhane_kayit(String datetime) {
    if (lastyemekhane == "çıkış") {
      qrmodel ekle = qrmodel(status: "giriş", datetime: datetime);
      _yemekhane.add(ekle);
      lastyemekhane = "giriş";
    } else if (lastyemekhane == "giriş") {
      qrmodel ekle = qrmodel(status: "çıkış", datetime: datetime);
      _yemekhane.add(ekle);
      lastyemekhane = "çıkış";
    }
    notifyListeners();
  }
}

class qrmodel {
  String? status;
  String? datetime;

  qrmodel({required this.status, required this.datetime});
}
