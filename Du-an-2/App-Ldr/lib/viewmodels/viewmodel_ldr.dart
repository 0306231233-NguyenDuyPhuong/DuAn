import 'package:flutter/foundation.dart';
import '../service/service_ldr.dart';

class LdrViewModel extends ChangeNotifier {
  final _service = ServiceLdr();
  Stream<CombinedData> get combinedStream => _service.combinedStream();

  void updateLed(String key, bool value) {
    _service.updateLed(key, value);
  }
}
