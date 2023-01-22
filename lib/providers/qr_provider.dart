import 'package:flutter/material.dart';

class QrProvider with ChangeNotifier {
  List<QrModel> _okul = [];
  List<QrModel> _yemekhane = [];

  List<QrModel> get okul => List.from(_okul.reversed);
  List<QrModel> get yemekhane => List.from(_yemekhane.reversed);

  String? lastokul = "çıkış";
  String? lastyemekhane = "çıkış";

  void okul_kayit(String datetime) {
    if (lastokul == "çıkış") {
      QrModel ekle = QrModel(status: "giriş", datetime: datetime);
      _okul.add(ekle);
      lastokul = "giriş";
    } else if (lastokul == "giriş") {
      QrModel ekle = QrModel(status: "çıkış", datetime: datetime);
      _okul.add(ekle);
      lastokul = "çıkış";
    }
    notifyListeners();
  }

  void yemekhane_kayit(String datetime) {
    if (lastyemekhane == "çıkış") {
      QrModel ekle = QrModel(status: "giriş", datetime: datetime);
      _yemekhane.add(ekle);
      lastyemekhane = "giriş";
    } else if (lastyemekhane == "giriş") {
      QrModel ekle = QrModel(status: "çıkış", datetime: datetime);
      _yemekhane.add(ekle);
      lastyemekhane = "çıkış";
    }
    notifyListeners();
  }
}

class QrModel {
  String? status;
  String? datetime;

  QrModel({required this.status, required this.datetime});
}
