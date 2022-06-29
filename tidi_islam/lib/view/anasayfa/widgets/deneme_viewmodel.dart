/*
import 'package:tidi_islam/model/home_model.dart';
import 'package:tidi_islam/services/services.dart';

class HomeEntity {
  final String? title;
  final List<Videolar> videolar;
}

class HomeVirewModel {
  static final shared = HomeVirewModel();
  HomeModel home = HomeModel();
  List<HomeEntity> dizi = [];
  Future<HomeModel> getHomeModel() async {
    final favoriteModel Home =
        await Service().favoriteListCall(page: "0", perPage: "12");
    List<Product>? item = [];
    List<CatProducts>? cPRo = [];
    final homeModel = await Service().fetchAlbum();

    favoriteModel?.videos?.forEach((videos) {
      item.clear();
      homeModel.products?.forEach((element) {
        element.catProducts?.forEach((cat) {

          cPRo.add(CatProducts(
              isFavorite: cat.title == videos.title,
              embed: cat.embed,
              cattitle: cat.title,
              description: cat.description,
              imageVitrin: cat.imageVitrin,
              id: cat.id,
              categoryId: cat.categoryId,
              title: cat.title,
              slug: cat.slug,
              dateAdd: cat.dateAdd,
              image: cat.image));
        });
        item.add(Product(
            catProducts: cPRo,
            catTitle: element.catTitle,
            catContent: element.catContent,
            catTitleBaslik: element.catTitleBaslik));
      });
    });
    final deneme = HomeModel(products: item);
    home = deneme;
    return home;
  }
}


 */