import 'package:qr_flutter/qr_flutter.dart';
import 'package:yga/models/userModel.dart';

class QrSingleton {
  static QrSingleton? _instance;

  QrSingleton._internal();

  static QrSingleton getInstance() {
    _instance ??= QrSingleton._internal();
    return _instance!;
  }

  QrImage schoolQR(User? user) {
    return QrImage(
      data: "${user!.sId} ${user.name} ${user.surName} ${DateTime.now()} okul ",
      version: QrVersions.auto,
      size: 200.0,
    );
  }

  QrImage cafeteriaQR(User? user) {
    return QrImage(
      data:
          "${user!.sId} ${user.name} ${user.surName} ${DateTime.now()} yemekhane",
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
