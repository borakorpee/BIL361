import 'package:yga/models/bakiye_model.dart';

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

UserAdapter _adapter = UserAdapter();
//User user = _adapter.getUser(response.body); //response.body == json

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
