import 'package:yga/models/userModel.dart';
import 'package:yga/models/yemek_model.dart';

class Rezervasyon {
  User? sId;
  List<Yemek> rezervasyonlar = [];

  void addRez(Yemek yemek) {
    rezervasyonlar.add(yemek);
  }

  void deleteRez(Yemek yemek) {
    rezervasyonlar.remove(yemek);
  }
}
