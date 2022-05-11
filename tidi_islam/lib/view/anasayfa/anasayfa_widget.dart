import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:tidi_islam/services/video_oynatici.dart';
import 'package:tidi_islam/view/anasayfa/widgets/video_baslik_widget.dart';

class AnasayfaWidget extends StatefulWidget {
  const AnasayfaWidget({Key? key}) : super(key: key);

  @override
  State<AnasayfaWidget> createState() => _AnasayfaWidgetState();
}

class _AnasayfaWidgetState extends State<AnasayfaWidget> {
  final String url =
      'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80';
  final List<String> urls = [
    'http://tidislam.com/upload/ckfinder/images/slider/turk-isaret-dilinde-islam-slider-calismasi.JPG',
    'http://tidislam.com/upload/ckfinder/images/slider/dini-kelimeler-ve-anlamlarini-ogreniyorum-slider-calismasi.jpg',
    'http://tidislam.com/upload/ckfinder/images/slider/peygamber-efendimizin-hayati.JPG',
    'http://tidislam.com/upload/ckfinder/images/slider/dini-bilgiler-ogreniyorum-slider-calasimasi1.JPG',
    'http://tidislam.com/upload/ckfinder/images/slider/islami-ogreniyorum-cocuk.JPG',
  ];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            : photoSlider(),

        const VideoBaslikWidget(
          baslikAdi: 'DİNİ KELİMELER VE ANLAMLARI KADIN',
        ),

        /// Anasayfa üzerindeki üç adet video staic yapıda kuruldu.
        const VideoOynatici(
          embedCode: '3R1txw-QWDU',
          topTitle: 'DİRİLİŞ',
          bottomTitle: 'DİNİ KELİMELER VE ANLAMLARI KADIN',
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey.shade700,
        ),
        const VideoOynatici(
          embedCode: 'xRpbDXaZ0LU',
          topTitle: 'DİRAR MECLİSİ',
          bottomTitle: 'DİNİ KELİMELER VE ANLAMLARI KADIN',
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey.shade700,
        ),
        const VideoOynatici(
          embedCode: '5Sz77baduIA',
          topTitle: 'DİYANET İŞLERİ BAŞKANLIĞI',
          bottomTitle: 'DİNİ KELİMELER VE ANLAMLARI KADIN',
        ),

        const VideoBaslikWidget(
          baslikAdi: 'DİNİ KELİMELER VE ANLAMLARI ERKEK',
        ),
        const VideoOynatici(
          embedCode: 'Q4IdOFw6QYY',
          topTitle: 'ŞÜPHE',
          bottomTitle: 'DİNİ KELİMELER VE ANLAMLARI ERKEK',
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey.shade700,
        ),
        const VideoOynatici(
          embedCode: 'NwSRzzKGHIE',
          topTitle: 'TABİAT',
          bottomTitle: 'DİNİ KELİMELER VE ANLAMLARI ERKEK',
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey.shade700,
        ),
        const VideoOynatici(
          embedCode: '8H2myKLQ6U4',
          topTitle: 'TASDİK',
          bottomTitle: 'DİNİ KELİMELER VE ANLAMLARI ERKEK',
        ),
      ],
    );
  }

  SizedBox photoSlider() {
    return SizedBox(
      width: double.infinity,
      height: Get.height / 4,
      child: Swiper(
        onIndexChanged: (value) => debugPrint(value.toString()),
        autoplayDelay: 10000,
        duration: 1000,
        indicatorLayout: PageIndicatorLayout.NONE,
        layout: SwiperLayout.DEFAULT,
        itemCount: urls.length,
        itemBuilder: (BuildContext context, int index) => OctoImage(
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Text(
              'Yüklenirken bir sorun oluştu...',
              style: TextStyle(color: Colors.white),
            ),
          ),
          image: NetworkImage(
            urls[index],
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