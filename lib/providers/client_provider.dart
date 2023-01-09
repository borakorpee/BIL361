import 'package:flutter/material.dart';
import 'package:yga/models/client_model.dart';

class ClientProvider extends ChangeNotifier {
  ClientModel _client =
      ClientModel(client: null, message: '', status: null, token: '');

  Client? get get_client => _client.client;

  void setClient(dynamic client) {
    _client = ClientModel.fromJson(client);
  }
}
