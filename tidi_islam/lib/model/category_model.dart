// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    CategoryModel({
        this.category,
        this.videosx,
    });

    Category?category;
    List<Videox>? videosx;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        category: Category.fromJson(json["category"]),
        videosx: List<Videox>.from(json["videos"].map((x) => Videox.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": category!.toJson(),
        "videos": List<dynamic>.from(videosx!.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.id,
        this.parentId,
        this.image,
        this.imageKapak,
        this.status,
        this.order,
        this.categoryId,
        this.languageCode,
        this.title,
        this.slug,
        this.description,
        this.metaTitle,
        this.keywords,
        this.metaDescription,
    });

    String? id;
    String? parentId;
    String? image;
    String? imageKapak;
    String? status;
    String? order;
    String? categoryId;
    String? languageCode;
    String? title;
    String? slug;
    String? description;
    String? metaTitle;
    String? keywords;
    String? metaDescription;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        parentId: json["parent_id"],
        image: json["image"],
        imageKapak: json["image_kapak"],
        status: json["status"],
        order: json["order"],
        categoryId: json["category_id"],
        languageCode: json["language_code"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        metaTitle: json["meta_title"],
        keywords: json["keywords"],
        metaDescription: json["meta_description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "image": image,
        "image_kapak": imageKapak,
        "status": status,
        "order": order,
        "category_id": categoryId,
        "language_code": languageCode,
        "title": title,
        "slug": slug,
        "description": description,
        "meta_title": metaTitle,
        "keywords": keywords,
        "meta_description": metaDescription,
    };
}

class Videox {
    Videox({
        this.id,
        this.categoryId,
        this.languageCode,
        this.videoTitle,
        this.slug,
        this.description,
        this.metaTitle,
        this.keywords,
        this.metaDescription,
        this.image,
        this.imageVitrin,
        this.embed,
        this.status,
        this.order,
        this.dateAdd,
        this.hits,
        this.videoid,
        this.title,
    });

    String? id;
    String? categoryId;
    String? languageCode;
    String? videoTitle;
    String? slug;
    String? description;
    String? metaTitle;
    String? keywords;
    String? metaDescription;
    String? image;
    String? imageVitrin;
    String? embed;
    String? status;
    String? order;
    DateTime? dateAdd;
    String? hits;
    dynamic videoid;
    String? title;

    factory Videox.fromJson(Map<String, dynamic> json) => Videox(
        id: json["id"],
        categoryId: json["category_id"],
        languageCode: json["language_code"],
        videoTitle: json["title"],
        slug: json["slug"],
        description: json["description"],
        metaTitle: json["meta_title"],
        keywords: json["keywords"],
        metaDescription: json["meta_description"],
        image: json["image"],
        imageVitrin: json["image_vitrin"],
        embed: json["embed"],
        status: json["status"],
        order: json["order"],
        dateAdd: DateTime.parse(json["date_add"]),
        hits: json["hits"],
        videoid: json["videoid"],
        title: json["Title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "language_code": languageCode,
        "title": videoTitle,
        "slug": slug,
        "description": description,
        "meta_title": metaTitle,
        "keywords": keywords,
        "meta_description": metaDescription,
        "image": image,
        "image_vitrin": imageVitrin,
        "embed": embed,
        "status": status,
        "order": order,
        "date_add": dateAdd.toString(),
        "hits": hits,
        "videoid": videoid,
        "Title": title,
    };
}
