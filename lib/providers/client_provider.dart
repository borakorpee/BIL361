import 'package:flutter/material.dart';
import 'package:yga/models/client_model.dart';

class ClientProvider extends ChangeNotifier {
  ClientModel _client = ClientModel(
    client: null,
    message: '',
    status: null,
    token: '',
  );

  String get get_token => _client.token as String;
  Client? get get_client => _client.client;

  void setClient(dynamic client) {
    _client = ClientModel.fromJson(client);
  }

  void updateBalance(int? price) {
    int bakiye = int.parse(_client.client?.bakiye as String);
    var new_total = bakiye + price!.toInt();

    _client.client!.bakiye = new_total.toString();
    notifyListeners();
  }
}
