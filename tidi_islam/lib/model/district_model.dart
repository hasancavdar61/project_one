// To parse this JSON data, do
//
//     final district = districtFromJson(jsonString);

import 'dart:convert';

District districtFromJson(String str) => District.fromJson(json.decode(str));

String districtToJson(District data) => json.encode(data.toJson());

class District {
  District({
    this.ilceler,
  });

  List<Ilceler>? ilceler;

  factory District.fromJson(Map<String, dynamic> json) => District(
        ilceler:
            List<Ilceler>.from(json["ilceler"].map((x) => Ilceler.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ilceler": List<dynamic>.from(ilceler!.map((x) => x.toJson())),
      };
}

class Ilceler {
  Ilceler({
    this.id,
    this.cityId,
    this.name,
  });

  String? id;
  String? cityId;
  String? name;

  factory Ilceler.fromJson(Map<String, dynamic> json) => Ilceler(
        id: json["id"],
        cityId: json["city_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_id": cityId,
        "name": name,
      };
}
