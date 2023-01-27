class Yemek {
  String? sId;
  DateTime? date;
  String? fiyat;
  String? yemekhane;
  List<String>? menu;
  int? iV;
  String? ogun;

  Yemek({
    this.sId,
    this.date,
    this.fiyat,
    this.yemekhane,
    this.menu,
    this.iV,
    this.ogun,
  });

  Yemek.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    fiyat = json['fiyat'];
    yemekhane = json['yemekhane'];
    menu = json['menü'].cast<String>();
    iV = json['__v'];
    ogun = json['ogun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['date'] = this.date;
    data['fiyat'] = this.fiyat;
    data['yemekhane'] = this.yemekhane;
    data['menü'] = this.menu;
    data['__v'] = this.iV;
    data['ogun'] = this.ogun;
    return data;
  }
}
