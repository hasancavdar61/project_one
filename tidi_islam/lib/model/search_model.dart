// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    SearchModel({
        this.products,
    });

    List<Product>? products;

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.id,
        this.image,
        this.embed,
        this.description,
        this.title,
        this.slug,
    });

    String? id;
    String? image;
    String? embed;
    String? description;
    String? title;
    String? slug;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        image: json["image"],
        embed: json["embed"],
        description: json["description"],
        title: json["title"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "embed": embed,
        "description": description,
        "title": title,
        "slug": slug,
    };
}
