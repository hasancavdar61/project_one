import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:octo_image/octo_image.dart';
import 'package:tidi_islam/model/home_model.dart';
import 'package:tidi_islam/riverpod/home_riverpod.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/services/video_oynatici.dart';
import 'package:tidi_islam/view/anasayfa/widgets/video_baslik_widget.dart';

class AnasayfaWidget extends ConsumerStatefulWidget {
  const AnasayfaWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AnasayfaWidget> createState() => _AnasayfaWidgetState();
}

class _AnasayfaWidgetState extends ConsumerState<AnasayfaWidget> {
  bool _isLoading = true;

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    Service().fetchAlbum();
    ref.read(homeRiverpod).fetchSlider();
    ref.read(homeRiverpod).fetchFavoritelist();
    ref.read(homeRiverpod).fetchMenu();

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeRiverpod);
    return FutureBuilder(
        future: Service().fetchAlbum(),
        builder: (context, AsyncSnapshot<HomeModel> snapshot) {
          if (snapshot.hasData) {
            return _body(snapshot, state);
          } else {
            return const Center(
                child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ));
          }
        });
  }

  Widget deneme(List<CatProducts>? data) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Column(
          children: [
            VideoOynatici(
              id: data?[index].id,
              imageUrl: data?[index].image,
              embedCode: data?[index].embed,
              topTitle: data?[index].title,
              bottomTitle: data![index].description! + ' KADIN',
            ),
            const Divider(
              indent: 15.0,
              endIndent: 15.0,
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
        itemCount: data?.length ?? 0,
      );
  Widget deneme2(List<CatProducts>? data) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Column(
          children: [
            VideoOynatici(
              id: data?[index].id,
              imageUrl: data?[index].image,
              embedCode: data?[index].embed,
              topTitle: data?[index].title,
              bottomTitle: data![index].description! + ' ERKEK',
            ),
            const Divider(
              indent: 15.0,
              endIndent: 15.0,
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
        itemCount: data?.length ?? 0,
      );
  Widget deneme3(List<CatProducts>? data) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Column(
          children: [
            VideoOynatici(
              id: data?[index].id,
              imageUrl: data?[index].image,
              embedCode: data?[index].embed,
              topTitle: data?[index].title,
              bottomTitle: data![index].description! + ' KADIN',
            ),
            const Divider(
              indent: 15.0,
              endIndent: 15.0,
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
        itemCount: data?.length ?? 0,
      );
  Widget deneme4(List<CatProducts>? data) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Column(
          children: [
            VideoOynatici(
              id: data?[index].id,
              imageUrl: data?[index].image,
              embedCode: data?[index].embed,
              topTitle: data?[index].title,
              bottomTitle: data![index].description! + ' ERKEK',
            ),
            const Divider(
              indent: 15.0,
              endIndent: 15.0,
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
        itemCount: data?.length ?? 0,
      );
  Widget deneme5(List<CatProducts>? data) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Column(
          children: [
            VideoOynatici(
              id: data?[index].id,
              imageUrl: data?[index].image,
              embedCode: data?[index].embed,
              topTitle: data?[index].title,
              bottomTitle: data![index].description!,
            ),
            const Divider(
              indent: 15.0,
              endIndent: 15.0,
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
        itemCount: data?.length ?? 0,
      );

  photoSlider(HomeRiverpod state) {
    return SizedBox(
      width: double.infinity,
      height: Get.height / 4,
      child: Swiper(
        onIndexChanged: (value) => debugPrint(value.toString()),
        autoplayDelay: 10000,
        duration: 1000,
        indicatorLayout: PageIndicatorLayout.NONE,
        layout: SwiperLayout.DEFAULT,
        itemCount: state.dataSlider?.length ?? 0,
        itemBuilder: (BuildContext context, int index) => OctoImage(
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Text(
              'Yüklenirken bir sorun oluştu...',
              style: TextStyle(color: Colors.white),
            ),
          ),
          image: NetworkImage(
            'http://tidislam.com' + state.dataSlider![index].mobilImage!,
          ),
          placeholderBuilder: (context) => const Center(
            child: SpinKitFadingCircle(
              color: Colors.teal,
            ),
          ),
          fit: BoxFit.fill,
        ),
        autoplay: true,
      ),
    );
  }

  Widget _body(AsyncSnapshot<HomeModel> snapshot, HomeRiverpod state) => Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                /// Fotoğraf geçişleri [ImageSlideshow] ile yapılıyor.
                /// Fotoğraflar

                /// Atomic yapıda olan [VideoBaslikWidget] video başlığını tutar static.
                /// [baslikAdi] parametresi [String] yapıdadır.

                _isLoading == true
                    ? const Center(
                        child: SpinKitFadingCircle(
                          color: Colors.teal,
                        ),
                      )
                    : photoSlider(state),

                const VideoBaslikWidget(
                  baslikAdi: 'DİNİ KELİMELER VE ANLAMLARI KADIN',
                ),
                deneme(snapshot.data!.products![0].catProducts),

                const VideoBaslikWidget(
                  baslikAdi: 'DİNİ KELİMELER VE ANLAMLARI ERKEK',
                ),
                deneme2(snapshot.data!.products![1].catProducts),
                const VideoBaslikWidget(
                  baslikAdi: 'DİNİ BİLGİLER KADIN',
                ),
                deneme3(snapshot.data!.products![2].catProducts),
                const VideoBaslikWidget(
                  baslikAdi: 'DİNİ BİLGİLER ERKEK',
                ),
                deneme4(snapshot.data!.products![3].catProducts),
                const VideoBaslikWidget(
                  baslikAdi: 'DİNİ KELİMELER VE ANLAMLARI ÇOCUK',
                ),
                deneme5(snapshot.data!.products![4].catProducts),

                const VideoBaslikWidget(
                  baslikAdi: 'DİNİ BİLGİLER ÇOCUK',
                ),
                deneme5(snapshot.data!.products![5].catProducts),
              ],
            ),
          ),
        ],
      );
}


/*
 GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return const VideoGrid(
                embedCode: 'nX8-oEvKvx0',
              );
            }),
*/
