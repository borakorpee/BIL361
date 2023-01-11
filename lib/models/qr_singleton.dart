import 'package:qr_flutter/qr_flutter.dart';
import 'package:yga/models/client_model.dart';

class QrSingleton {
  static QrSingleton? _instance;

  QrSingleton._internal();

  static QrSingleton getInstance() {
    _instance ??= QrSingleton._internal();
    return _instance!;
  }

  QrImage schoolQR(Client? client) {
    return QrImage(
      data:
          "${client!.sId} ${client.name} ${client.surName} ${DateTime.now()} okul ",
      version: QrVersions.auto,
      size: 200.0,
    );
  }

  QrImage cafeteriaQR(Client? client) {
    return QrImage(
      data:
          "${client!.sId} ${client.name} ${client.surName} ${DateTime.now()} yemekhane",
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
