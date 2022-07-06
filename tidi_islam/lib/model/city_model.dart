// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    this.iller,
  });

  List<Iller>? iller;

  factory City.fromJson(Map<String, dynamic> json) => City(
        iller: List<Iller>.from(json["iller"].map((x) => Iller.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ilceler": List<dynamic>.from(iller!.map((x) => x.toJson())),
      };
}

class Iller {
  Iller({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Iller.fromJson(Map<String, dynamic> json) => Iller(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

Cityy cityyFromJson(String str) => Cityy.fromJson(json.decode(str));

String cityyToJson(Cityy data) => json.encode(data.toJson());

class Cityy {
  Cityy({
    this.illerr,
  });

  List<Iller>? illerr;

  factory Cityy.fromJson(Map<String, dynamic> json) => Cityy(
        illerr: List<Iller>.from(json["ilceler"].map((x) => Iller.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "iller": List<dynamic>.from(illerr!.map((x) => x.toJson())),
      };
}

class Illerr {
  Illerr({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Illerr.fromJson(Map<String, dynamic> json) => Illerr(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
