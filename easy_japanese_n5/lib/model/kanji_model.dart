import 'dart:convert';

Kanji kanjiFromJson(String str) {
  final jsonData = json.decode(str);
  return Kanji.fromMap(jsonData);
}

String kanjiToJson(Kanji data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Kanji {
  int id;
  String sign;
  String onyomi;
  String kunyomi;
  String meaning;
  var gifImage;


  Kanji({
    this.id,
    this.sign,
    this.onyomi,
    this.kunyomi,
    this.meaning,
    this.gifImage
  });

  factory Kanji.fromMap(Map<String, dynamic> json) => new Kanji(
    id: json["id"],
    sign: json["sign"],
    onyomi: json["onyomi"],
    kunyomi: json["kunyomi"],
    meaning: json["meaning"],
    gifImage: json["gif"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "sign": sign,
    "onyomi": onyomi,
    "kunyomi": kunyomi,
    "meaning": meaning,
    "gif": gifImage
  };
}