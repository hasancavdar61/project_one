import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/model/category_model.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/services/video_oynatici.dart';

class KategoriWidget extends ConsumerStatefulWidget {
  const KategoriWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<KategoriWidget> createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends ConsumerState<KategoriWidget> {
  var catData = Get.arguments[0];
  var catDataTitle = Get.arguments[1];
  List<Videox>? dataCatVideo = [];
  @override
  void initState() {
    Service().categoryCall(slug: catData.toString()).then((value) {
      if (value != null) {
        setState(() {
          dataCatVideo = value.videosx;
        });
      } else {
        throw ('Bir sorun oluştu');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          title: catDataTitle != null
              ? AutoSizeText(
                  catDataTitle.toString(),
                  maxFontSize: 18,
                  minFontSize: 12,
                )
              : const Text('TİDİSLAM'),
          automaticallyImplyLeading: true,
        ),

        /// Kategori listeden gelen embed codeları kullanır.
        body: FutureBuilder(
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
                itemBuilder: ((context, index) {
                  return VideoOynatici(
                    id: dataCatVideo![index].id,
                    embedCode: dataCatVideo![index].embed,
                    topTitle: dataCatVideo![index].title,
                    bottomTitle: dataCatVideo![index].description,
                    imageUrl: dataCatVideo![index].image,
                  );
                }),
                itemCount: dataCatVideo!.length,
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Aradığınız kriterlere uygun video bulunamadı.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ));
            }
          }),
          future: Service().categoryCall(slug: catData.toString()),
        ),
      ),
    );
  }
}
