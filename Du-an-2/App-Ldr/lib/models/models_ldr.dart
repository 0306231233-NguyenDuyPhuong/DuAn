class LDRModel {
  int ldr1;
  int ldr2;
  int ldr3;

  LDRModel({
    required this.ldr1,
    required this.ldr2,
    required this.ldr3,
  });

  factory LDRModel.fromJson(Map<String, dynamic> json) {
    return LDRModel(
      ldr1: json['LDR_1'] ?? 0,
      ldr2: json['LDR_2'] ?? 0,
      ldr3: json['LDR_3'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'LDR_1': ldr1,
      'LDR_2': ldr2,
      'LDR_3': ldr3,
    };
  }
}