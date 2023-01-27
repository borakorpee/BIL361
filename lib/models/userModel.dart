import 'package:yga/models/bakiye_model.dart';

class User {
  String? sId;
  String? name;
  String? surName;
  String? pass;
  String? no;
  Bakiye? bakiye;
  User({
    required this.sId,
    required this.name,
    required this.surName,
    required this.pass,
    required this.no,
    required this.bakiye,
  });
}
