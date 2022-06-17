// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
    SliderModel({
        this.slider,
    });

    List<Sliders>? slider;

    factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        slider: List<Sliders>.from(json["slider"].map((x) => Sliders.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "slider": List<dynamic>.from(slider!.map((x) => x.toJson())),
    };
}

class Sliders {
    Sliders({
        this.id,
        this.href,
        this.description,
        this.order,
        this.mobilImage,
    });

    String? id;
    String? href;
    String? description;
    String? order;
    String? mobilImage;

    factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
        id: json["id"],
        href: json["href"],
        description: json["description"],
        order: json["order"],
        mobilImage: json["mobil_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
        "description": description,
        "order": order,
        "mobil_image": mobilImage,
    };
}
