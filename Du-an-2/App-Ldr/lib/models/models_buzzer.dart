class Buzzer{
  final bool auto;
  final bool buzzer;

  Buzzer(this.auto, this.buzzer);

  factory Buzzer.fromJson(Map<String, dynamic> json){
    return Buzzer(json["auto"], json["buzzer"]);
  }

  Map<String, dynamic> toJson(){
    return {
      "auto":this.auto,
      "buzzer":this.buzzer
    };
  }
}