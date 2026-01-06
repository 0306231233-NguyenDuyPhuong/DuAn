import 'package:app_ldr/models/models_buzzer.dart';
import 'package:app_ldr/models/models_ldr.dart';
import 'package:app_ldr/models/models_led.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';

class CombinedData {
  final LDRModel ldr;
  final LEDModel led;
  final Buzzer load;
  CombinedData({required this.ldr, required this.led, required this.load});
}

class ServiceLdr {
  final _db = FirebaseDatabase.instance.ref();

  Stream<LDRModel> streamLDR() {
    return _db.child("LDR").onValue.map((event) {
      final raw = event.snapshot.value as Map<Object?, Object?>;
      return LDRModel.fromJson(Map<String, dynamic>.from(raw));
    });
  }

  Stream<Buzzer> streamLoad() {
    return _db.onValue.map((event) {
      final data = event.snapshot.value as Map;
      return Buzzer.fromJson(Map<String, dynamic>.from(data));
    });
  }

  Stream<LEDModel> streamLED() {
    return _db.child("LEDS").onValue.map((event) {
      final raw = event.snapshot.value as Map<Object?, Object?>;
      return LEDModel.fromJson(Map<String, dynamic>.from(raw));
    });
  }

  Stream<CombinedData> combinedStream() {
    return Rx.combineLatest3(
      streamLDR(),
      streamLED(),
      streamLoad(),
          (ldr, led, load) {
        return CombinedData(
          ldr: ldr,
          led: led,
          load: load,
        );
      },
    );
  }
  //update led
  void updateLed(String key, bool value) {
    _db.child('LEDS').child(key).set(value);
  }
}
