import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:octo_image/octo_image.dart';
import 'package:tidi_islam/model/category_model.dart';
import 'package:tidi_islam/model/home_model.dart';
import 'package:tidi_islam/riverpod/home_riverpod.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/services/tablet_oynatici.dart';
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
  Service service = Service();
  bool isVisible = false;
  late FocusNode myFocusNode;
  List<Videox>? dataCatVideo = [];
  TextEditingController editingController = TextEditingController();
  var catData = '';

  @override
  void initState() {
    Service().fetchAlbum();
    ref.read(homeRiverpod).fetchSlider();
    ref.read(homeRiverpod).fetchMenu();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });

    myFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeRiverpod);
    int indexx = 0;
    return FutureBuilder(
        future: Service().fetchAlbum(),
        builder: (context, AsyncSnapshot<HomeModel> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
                onRefresh: () async {
                  await Service().fetchAlbum();
                  setState(() {});
                },
                child: _body(snapshot, state, indexx));
          } else {
            return Center(
              child: SpinKitPumpingHeart(
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Image.asset('assets/tidislam-logo-splash.png'));
                },
              ),
            );
          }
        });
  }

  photoSlider(HomeRiverpod state) {
    return SizedBox(
      width: double.infinity,
      height: context.isTablet ? Get.height / 1.5 : Get.height / 4,
      child: Swiper(
        controller: SwiperController(),
        plugins: [
          SwiperPagination(
            margin: const EdgeInsets.all(5.0),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black.withOpacity(0.5), activeColor: Colors.teal),
          ),
        ],
        onIndexChanged: (value) => debugPrint(value.toString()),
        autoplayDelay: 10000,
        duration: 1000,
        indicatorLayout: PageIndicatorLayout.COLOR,
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

  Widget _body(
          AsyncSnapshot<HomeModel> snapshot, HomeRiverpod state, int indexx) =>
      Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                /// Fotoğraf geçişleri [ImageSlideshow] ile yapılıyor.

                /// Atomic yapıda olan [VideoBaslikWidget] video başlığını tutar static.
                /// [baslikAdi] parametresi [String] yapıdadır.

                /// Search

                Container(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 13.50, right: 13.50),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    focusNode: myFocusNode,
                    onTap: () => setState(() {
                      isVisible = true;
                    }),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          isVisible = false;
                        });
                      } else {
                        setState(() {
                          isVisible = true;
                        });
                      }
                    },
                    onEditingComplete: () {
                      Get.toNamed('/SearchPage',
                          arguments: [editingController.text]);
                      myFocusNode.unfocus();
                      isVisible = false;
                    },
                    style: const TextStyle(color: Colors.white),
                    controller: editingController,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      hintText: 'Aramaya buradan başlayın',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.zero),
                    ),
                  ),
                ),

                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 13.50, right: 13.50, top: 10.0, bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //arama butonu
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              myFocusNode.unfocus();

                              setState(() {
                                isVisible = false;
                              });

                              Get.toNamed('/SearchPage',
                                  arguments: [editingController.text]);
                              editingController.clear();
                            },
                            child: Container(
                              color: Colors.teal,
                              padding: const EdgeInsets.all(9.0),
                              child: const Text(
                                'Ara',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        //sonucu temizleme butonu
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              editingController.clear();
                              setState(() {
                                isVisible = false;
                              });
                              myFocusNode.unfocus();
                            },
                            child: Container(
                              color: Colors.redAccent,
                              padding: const EdgeInsets.all(9.0),
                              child: const Text(
                                'Sonucu Temizle',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                _isLoading == true
                    ? const Center(
                        child: SpinKitFadingCircle(
                          color: Colors.teal,
                        ),
                      )
                    : photoSlider(state),

                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return context.isTablet
                          ? videoGrid(snapshot, index)
                          : videoList(snapshot, index);
                    }),
                    itemCount: snapshot.data?.products!.length ?? 0),
              ],
            ),
          ),
        ],
      );

  /// Videoyu [GridView.builder] ile listeleme için kullanılan method.
  Column videoGrid(
    AsyncSnapshot<HomeModel> snapshot,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/KategoriSayfasi', arguments: [
              snapshot.data!.products![index].catHref,
              snapshot.data!.products![index].catTitle,
              ''
            ]);
          },
          child: VideoBaslikWidget(
            baslikAdi: snapshot.data!.products![index].catTitle,
          ),
        ),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data?.products![index].catProducts!.length ?? 0,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, indexx) {
              return TabletOynatici(
                iconColor: GetStorage().read(snapshot
                            .data!.products![index].catProducts![indexx].id
                            .toString()) ==
                        snapshot.data!.products![index].catProducts![indexx].id
                    ? Colors.red
                    : Colors.black,
                id: snapshot.data?.products![index].catProducts![indexx].id,
                imageUrl:
                    snapshot.data?.products![index].catProducts![indexx].image,
                embedCode:
                    snapshot.data?.products![index].catProducts![indexx].embed,
                topTitle:
                    snapshot.data?.products![index].catProducts![indexx].title,
                bottomTitle: snapshot
                    .data?.products![index].catProducts![indexx].description,
              );
            }),
      ],
    );
  }
}

/// Videoyu [ListView.seperated] ile listeleme için kullanılan method.
Column videoList(AsyncSnapshot<HomeModel> snapshot, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          Get.toNamed('/KategoriSayfasi', arguments: [
            snapshot.data!.products![index].catHref,
            snapshot.data!.products![index].catTitle,
            ''
          ]);
        },
        child: VideoBaslikWidget(
          baslikAdi: snapshot.data!.products![index].catTitle,
        ),
      ),
      ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.grey,
            );
          },
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data?.products![index].catProducts!.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (context, indexx) {
            return VideoOynatici(
              iconColor: GetStorage().read(snapshot
                          .data!.products![index].catProducts![indexx].id
                          .toString()) ==
                      snapshot.data!.products![index].catProducts![indexx].id
                  ? Colors.red
                  : Colors.black,
              id: snapshot.data?.products![index].catProducts![indexx].id,
              imageUrl:
                  snapshot.data?.products![index].catProducts![indexx].image,
              embedCode:
                  snapshot.data?.products![index].catProducts![indexx].embed,
              topTitle:
                  snapshot.data?.products![index].catProducts![indexx].title,
              bottomTitle: snapshot
                  .data?.products![index].catProducts![indexx].description,
            );
          }),
    ],
  );
}
