import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class VideoBaslikWidget extends StatelessWidget {
  const VideoBaslikWidget({
    Key? key,
    this.baslikAdi,
    this.embedCode,
    this.topTitle,
    this.bottomTitle,
  }) : super(key: key);

  final String? baslikAdi;
  final String? embedCode;
  final String? topTitle;
  final String? bottomTitle;

  /// [Padding] widgeti içinde bulunan [Container] sadece anasayfada kategori
  /// aralarını bölmek ve hangş kategori hangi isimi alıyor göstermek için
  /// static yapıda kullanılmıştır.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 9.0, bottom: 9.0),
          child: Container(
            color: Colors.teal,
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                AutoSizeText(
                  baslikAdi!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
