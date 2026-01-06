
class LEDModel {
  bool led1;
  bool led2;
  bool led3;
  bool led4;
  bool led5;
  bool led6;
  bool autoMode;
  bool buzzer;
  int test;

  LEDModel({
    required this.led1,
    required this.led2,
    required this.led3,
    required this.led4,
    required this.led5,
    required this.led6,
    required this.autoMode,
    required this.buzzer,
    required this.test,
  });

  factory LEDModel.fromJson(Map<String, dynamic> json) {
    return LEDModel(
      led1: json['LED_1'] ?? false,
      led2: json['LED_2'] ?? false,
      led3: json['LED_3'] ?? false,
      led4: json['LED_4'] ?? false,
      led5: json['LED_5'] ?? false,
      led6: json['LED_6'] ?? false,
      autoMode: json['auto'] ?? false,
      buzzer: json['buzzer'] ?? false,
      test: json['test'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'LED_1': led1,
      'LED_2': led2,
      'LED_3': led3,
      'LED_4': led4,
      'LED_5': led5,
      'LED_6': led6,
      'auto': autoMode,
      'buzzer': buzzer,
      'test': test,
    };
  }
}