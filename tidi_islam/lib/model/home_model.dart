// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';


HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.products,
  });

  final List<Product>? products;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product(
      {this.catTitle,
      this.catTitleBaslik,
      this.catSlug,
      this.catContent,
      this.catHref,
      this.catAsistanVideo,
      this.catProducts});

  final String? catTitle;
  final String? catTitleBaslik;
  final String? catSlug;
  final String? catContent;
  final String? catHref;
  final String? catAsistanVideo;
  List<CatProducts>? catProducts;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        catTitle: json["cat_title"],
        catTitleBaslik: json["cat_title_baslik"],
        catSlug: json["cat_slug"],
        catContent: json["cat_content"],
        catHref: json["cat_href"],
        catAsistanVideo: json["cat_asistan_video"],
        // amk andaval backendcisi listeye false bvool gönderiyor.
        catProducts: json["cat_products"] is bool ? null : List.from(json["cat_products"]).map((e) => CatProducts.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        "cat_title": catTitle,
        "cat_title_baslik": catTitleBaslik,
        "cat_slug": catSlug,
        "cat_content": catContent,
        "cat_href": catHref,
        "cat_asistan_video": catAsistanVideo,
      };
}

class CatProducts {
  String? id;
  String? image;
  String? imageVitrin;
  String? embed;
  String? dateAdd;
  String? hits;
  String? title;
  String? description;
  String? slug;
  String? categoryId;
  String? cattitle;

  CatProducts(
      {this.id,
      this.image,
      this.imageVitrin,
      this.embed,
      this.dateAdd,
      this.hits,
      this.title,
      this.description,
      this.slug,
      this.categoryId,
      this.cattitle});

  CatProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    imageVitrin = json['image_vitrin'];
    embed = json['embed'];
    dateAdd = json['date_add'];
    hits = json['hits'];
    title = json['title'];
    description = json['description'];
    slug = json['slug'];
    categoryId = json['category_id'];
    cattitle = json['cattitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['image_vitrin'] = imageVitrin;
    data['embed'] = embed;
    data['date_add'] = dateAdd;
    data['hits'] = hits;
    data['title'] = title;
    data['description'] = description;
    data['slug'] = slug;
    data['category_id'] = categoryId;
    data['cattitle'] = cattitle;
    return data;
  }
}

// To parse this JSON data, do
//
//     final homeSlider = homeSliderFromJson(jsonString);

HomeSlider homeSliderFromJson(String str) =>
    HomeSlider.fromJson(json.decode(str));

String homeSliderToJson(HomeSlider data) => json.encode(data.toJson());

class HomeSlider {
  HomeSlider({
    this.slider,
  });

  List<Slider>? slider;

  factory HomeSlider.fromJson(Map<String, dynamic> json) => HomeSlider(
        slider:
            List<Slider>.from(json["slider"].map((x) => Slider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slider": List<dynamic>.from(slider!.map((x) => x.toJson())),
      };
}

class Slider {
  Slider({
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

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
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
