// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  MenuModel({
    this.menus,
  });

  List<Menu>? menus;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menus": List<dynamic>.from(menus!.map((x) => x.toJson())),
      };
}

class Menu {
  Menu({
    this.id,
    this.image,
    this.title,
    this.slug,
    this.content,
    this.linkTipi,
    this.href,
    this.parent,
    this.parentTwo,
  });

  String? id;
  String? image;
  String? title;
  String? slug;
  String? content;
  String? linkTipi;
  String? href;
  List<Menu>? parent;
  List<Menu>? parentTwo;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        slug: json["slug"],
        content: json["content"],
        linkTipi: json["link_tipi"],
        href: json["href"],
        parent: json["parent"] == null
            ? null
            : List<Menu>.from(json["parent"].map((x) => Menu.fromJson(x))),
        parentTwo: json["parent_two"] == null
            ? null
            : List<Menu>.from(json["parent_two"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "slug": slug,
        "content": content,
        "link_tipi": linkTipi,
        "href": href,
        "parent": parent == null
            ? null
            : List<dynamic>.from(parent!.map((x) => x.toJson())),
        "parent_two": parentTwo == null
            ? null
            : List<dynamic>.from(parentTwo!.map((x) => x.toJson())),
      };
}
