import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/constants/alphabet.dart';
import 'package:tidi_islam/model/category_model.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/services/tablet_oynatici.dart';
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
  bool isSelected = true;
  Color color = Colors.white;
  Key key = const Key('id');
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

  int? _selectedIndex;

  onSelected(int index) {
    setState(() async {
      await Service().categoryCall(slug: catData.toString()).then((value) {
        if (value != null) {
          setState(() {
            dataCatVideo = value.videosx;
          });
        } else {
          throw ('Bir sorun oluştu');
        }
      });
      _selectedIndex = index;
      dataCatVideo?.retainWhere((element) {
        return element.title!.startsWith(alphabet[_selectedIndex!]);
      });
    });
  }

  onNotSelected(int index) {
    setState(() {
      _selectedIndex = index;
      dataCatVideo?.retainWhere((element) {
        return element.title!.startsWith(alphabet[_selectedIndex!]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(105.0),
        child: Column(
          children: [
            AppBar(
              centerTitle: true,
              title: catDataTitle != null
                  ? AutoSizeText(
                      catDataTitle.toString(),
                      maxFontSize: 18,
                      minFontSize: 12,
                    )
                  : const Text('TİDİSLAM'),
              automaticallyImplyLeading: true,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      onSelected(index);
                    },
                    highlightColor: Colors.teal,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      height: double.infinity,
                      key: key,
                      child: AutoSizeText(
                        alphabet[index],
                        maxFontSize: 20,
                        minFontSize: 8,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color:
                              _selectedIndex != null && _selectedIndex == index
                                  ? Colors.teal
                                  : Colors.white),
                    ),
                  );
                }),
                itemCount: alphabet.length,
              ),
            ),
          ],
        ),
      ),

      /// Kategori listeden gelen embed codeları kullanır.
      body: FutureBuilder(
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: context.isTablet ? videoGridT() : videoListT()),
              ],
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
    );
  }

  ListView videoListT() {
    return ListView.separated(
      shrinkWrap: true,
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
          iconColor: GetStorage().read(dataCatVideo![index].id!) ==
                  dataCatVideo![index].id
              ? Colors.white
              : Colors.black,
        );
      }),
      itemCount: dataCatVideo!.length,
    );
  }

  GridView videoGridT() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: ((context, index) {
        return TabletOynatici(
          id: dataCatVideo![index].id,
          embedCode: dataCatVideo![index].embed,
          topTitle: dataCatVideo![index].title,
          bottomTitle: dataCatVideo![index].description,
          imageUrl: dataCatVideo![index].image,
          iconColor: GetStorage().read(dataCatVideo![index].id!) ==
                  dataCatVideo![index].id
              ? Colors.white
              : Colors.black,
        );
      }),
      itemCount: dataCatVideo!.length,
    );
  }
}




/*

 setState(() {
                            if (isSelected) {
                              dataCatVideo?.retainWhere((element) {
                                return element.title!
                                    .startsWith(alphabet[index]);
                              });
                              _selectedIndex = index;
                              isSelected = false;
                            } else {
                              Service()
                                  .categoryCall(slug: catData.toString())
                                  .then((value) {
                                if (value != null) {
                                  setState(() {
                                    dataCatVideo = value.videosx;
                                  });
                                } else {
                                  throw ('Bir sorun oluştu');
                                }
                              });

                              isSelected = true;
                            }
                          }); */