// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.city,
  });

  List<City>? city;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        city: List<City>.from(json["city"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": List<dynamic>.from(city!.map((x) => x.toJson())),
      };
}

class City {
  City({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
