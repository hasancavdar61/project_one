import 'package:flutter/material.dart';
import 'package:tidi_islam/services/video_oynatici.dart';
import 'package:tidi_islam/view/anasayfa/widgets/video_baslik_widget.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AnasayfaWidget extends StatefulWidget {
  const AnasayfaWidget({Key? key}) : super(key: key);

  @override
  State<AnasayfaWidget> createState() => _AnasayfaWidgetState();
}

class _AnasayfaWidgetState extends State<AnasayfaWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// Fotoğraf geçişleri [ImageSlideshow] ile yapılıyor.
        /// Fotoğraflar
      

        /// Atomic yapıda olan [VideoBaslikWidget] video başlığını tutar static.
        /// [baslikAdi] parametresi [String] yapıdadır.

        ImageSlideshow(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          initialPage: 0,
          indicatorColor: Colors.teal,
          indicatorBackgroundColor: Colors.grey,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
          autoPlayInterval: 10000,
          isLoop: true,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
              fit: BoxFit.cover,
              cacheWidth: 469,
              cacheHeight: 264,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
              fit: BoxFit.cover,
              cacheWidth: 469,
              cacheHeight: 264,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1512632578888-169bbbc64f33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
              fit: BoxFit.cover,
              cacheWidth: 469,
              cacheHeight: 264,
            ),
          ],
        ),

        const VideoBaslikWidget(
          baslikAdi: 'DİNİ KELİMELER VE ANLAMLARI KADIN',
        ),
      /// Anasayfa üzerindeki üç adet video staic yapıda kuruldu.
        const VideoOynatici(
          embedCode: 'vRKYrcmqZEk',
        ),
        const VideoOynatici(
          embedCode: 'c6X3kyQJwVs',
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
        const VideoOynatici(
          embedCode: 'm1a2MLLQntY',
        ),
        const VideoOynatici(
          embedCode: 'lQvGtdUbF8I',
        ),
      ],
    );
  }
}
