import 'package:yga/models/userModel.dart';

import 'bakiye_model.dart';

class UserAdapter {
  User getUser(Map<String, dynamic> json) {
    String schoolNo = json['no'];
    String name = json['name'];
    String surname = json['surname'];
    String pass = json['pass'];
    String sId = json['sId'];
    Bakiye bakiye = json['bakiye'];

    return User(
      no: schoolNo,
      name: name,
      surName: surname,
      pass: pass,
      bakiye: bakiye,
      sId: sId,
    );
  }
}
