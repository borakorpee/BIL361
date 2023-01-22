class MealListModel {
  bool? status;
  String? message;
  Value? value;

  MealListModel(
      {required this.status, required this.message, required this.value});

  MealListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  List<Yemeks>? yemeks;

  Value({this.yemeks});

  Value.fromJson(Map<String, dynamic> json) {
    if (json['yemeks'] != null) {
      yemeks = <Yemeks>[];
      json['yemeks'].forEach((v) {
        yemeks!.add(new Yemeks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.yemeks != null) {
      data['yemeks'] = this.yemeks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Yemeks {
  String? sId;
  String? date;
  String? fiyat;
  String? yemekhane;
  List<String>? men;
  int? iV;
  String? ogun;

  Yemeks({
    this.sId,
    this.date,
    this.fiyat,
    this.yemekhane,
    this.men,
    this.iV,
    this.ogun,
  });

  Yemeks.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    fiyat = json['fiyat'];
    yemekhane = json['yemekhane'];
    men = json['menü'].cast<String>();
    iV = json['__v'];
    ogun = json['ogun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['date'] = this.date;
    data['fiyat'] = this.fiyat;
    data['yemekhane'] = this.yemekhane;
    data['menü'] = this.men;
    data['__v'] = this.iV;
    data['ogun'] = this.ogun;
    return data;
  }
}
