import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
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
    'http://tidislam.daynexdemo.tk/upload/ckfinder/images/slider/turk-isaret-dilinde-islam-slider-calismasi.JPG',
    'http://tidislam.daynexdemo.tk/upload/ckfinder/images/slider/dini-kelimeler-ve-anlamlarini-ogreniyorum-slider-calismasi.jpg',
    'http://tidislam.daynexdemo.tk/upload/ckfinder/images/slider/peygamber-efendimizin-hayati.JPG',
    'http://tidislam.daynexdemo.tk/upload/ckfinder/images/slider/dini-bilgiler-ogreniyorum-slider-calasimasi1.JPG',
    'http://tidislam.daynexdemo.tk/upload/ckfinder/images/slider/islami-ogreniyorum-cocuk.JPG',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Fotoğraf geçişleri [ImageSlideshow] ile yapılıyor.
        /// Fotoğraflar

        /// Atomic yapıda olan [VideoBaslikWidget] video başlığını tutar static.
        /// [baslikAdi] parametresi [String] yapıdadır.

        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          child: Swiper(
            onIndexChanged: (value) => debugPrint(value.toString()),
            autoplayDelay: 10000,
            duration: 1000,
            indicatorLayout: PageIndicatorLayout.NONE,
            layout: SwiperLayout.DEFAULT,
            itemCount: urls.length,
            itemBuilder: (BuildContext context, int index) => Image.network(
              urls[index],
              fit: BoxFit.fill,
            ),
            autoplay: true,
          ),
        ),

        const VideoBaslikWidget(
          baslikAdi: 'DİNİ KELİMELER VE ANLAMLARI KADIN',
        ),

        /// Anasayfa üzerindeki üç adet video staic yapıda kuruldu.
        const VideoOynatici(
          embedCode: 'vRKYrcmqZEk',
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey.shade700,
        ),
        const VideoOynatici(
          embedCode: 'c6X3kyQJwVs',
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey.shade700,
        ),
        const VideoOynatici(
          embedCode: 'nX8-oEvKvx0',
        ),

        const VideoBaslikWidget(
          baslikAdi: 'DİNİ KELİMELER VE ANLAMLARI ERKEK',
        ),

        const VideoOynatici(
          embedCode: '9ZzkegO1pg4',
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey.shade700,
        ),
        const VideoOynatici(
          embedCode: 'm1a2MLLQntY',
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey.shade700,
        ),
        const VideoOynatici(
          embedCode: 'lQvGtdUbF8I',
        ),
      ],
    );
  }
}
