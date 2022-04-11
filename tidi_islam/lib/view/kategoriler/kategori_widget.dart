import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/constants/video_embed_list.dart';
import 'package:tidi_islam/services/video_oynatici.dart';

class KategoriWidget extends StatefulWidget {
  const KategoriWidget({Key? key}) : super(key: key);

  @override
  State<KategoriWidget> createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends State<KategoriWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('TİDİSLAM'),
          actions: [
            TextButton(
              onPressed: () => Get.toNamed('/KategoriSayfasi'),
              child: const Text(
                'Giriş Yap',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        /// Kategori listeden gelen embed codeları kullanır.
        body: ListView.builder(
          itemCount: videoEmbedList.length,
          itemBuilder: ((context, index) => VideoOynatici(
                embedCode: videoEmbedList[index],
              )),
        ),
      ),
    );
  }
}
