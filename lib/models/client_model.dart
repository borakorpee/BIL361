class ClientModel {
  bool? status;
  String? message;
  String? token;
  Client? client;

  ClientModel(
      {required this.status,
      required this.message,
      required this.token,
      required this.client});

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      status: json['status'],
      message: json['message'],
      token: json['token'],
      client: Client.fromJson(json['client']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  String? sId;
  String? name;
  String? surName;
  String? pass;
  String? no;
  String? bakiye;
  String? createAt;
  int? iV;

  Client(
      {this.sId,
      this.name,
      this.surName,
      this.pass,
      this.no,
      this.bakiye,
      this.createAt,
      this.iV});

  Client.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    surName = json['surName'];
    pass = json['pass'];
    no = json['no'];
    bakiye = json['bakiye'];
    createAt = json['createAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['surName'] = this.surName;
    data['pass'] = this.pass;
    data['no'] = this.no;
    data['bakiye'] = this.bakiye;
    data['createAt'] = this.createAt;
    data['__v'] = this.iV;
    return data;
  }
}
