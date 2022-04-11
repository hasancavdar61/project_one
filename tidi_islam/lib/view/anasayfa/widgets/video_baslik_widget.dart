import 'package:flutter/material.dart';

class VideoBaslikWidget extends StatelessWidget {
  const VideoBaslikWidget({
    Key? key,
    this.baslikAdi,
  }) : super(key: key);

  final String? baslikAdi;

/// [Padding] widgeti içinde bulunan [Container] sadece anasayfada kategori
/// aralarını bölmek ve hangş kategori hangi isimi alıyor göstermek için
/// static yapıda kullanılmıştır.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9.0, bottom: 9.0),
      child: Container(
        color: Colors.teal,
        padding: const EdgeInsets.all(12.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          Text(
            baslikAdi!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
