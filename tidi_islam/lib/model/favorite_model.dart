// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel {
    FavoriteModel({
        this.videos,
    });

    List<Video>? videos;

    factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "videos": List<dynamic>.from(videos!.map((x) => x.toJson())),
    };
}

class Video {
    Video({
        this.id,
        this.image,
        this.imageVitrin,
        this.embed,
        this.status,
        this.order,
        this.title,
        this.slug,
        this.description,
        this.followId,
        this.userId,
    });

    String? id;
    String? image;
    String? imageVitrin;
    String? embed;
    String? status;
    String? order;
    String? title;
    String? slug;
    String? description;
    dynamic followId;
    dynamic userId;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        image: json["image"],
        imageVitrin: json["image_vitrin"],
        embed: json["embed"],
        status: json["status"],
        order: json["order"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        followId: json["follow_id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "image_vitrin": imageVitrin,
        "embed": embed,
        "status": status,
        "order": order,
        "title": title,
        "slug": slug,
        "description": description,
        "follow_id": followId,
        "user_id": userId,
    };
}
