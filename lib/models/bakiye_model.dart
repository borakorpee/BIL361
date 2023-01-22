class Bakiye {
  double? _bakiye;
  List<Function> _listeners = [];

  double? get bakiye => _bakiye;

  set bakiye(double? value) {
    _bakiye = value;
    _notifyListeners();
  }

  void addListener(Function listener) {
    _listeners.add(listener);
  }

  void removeListener(Function listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    _listeners.forEach((Function listener) => listener());
  }
}
