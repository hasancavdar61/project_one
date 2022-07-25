import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/constants/alphabet.dart';
import 'package:tidi_islam/model/category_model.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/services/tablet_oynatici.dart';
import 'package:tidi_islam/services/video_oynatici.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_view.dart';

class KategoriWidget extends ConsumerStatefulWidget {
  const KategoriWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<KategoriWidget> createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends ConsumerState<KategoriWidget> {
  var catData = Get.arguments[0];
  var catDataTitle = Get.arguments[1];
  var catTitle = Get.arguments[2];
  List<Videox>? dataCatVideo = [];
  List<Videox>? title = [];
  List? items;
  TextEditingController editingController = TextEditingController();
  bool isSelected = true;
  Color color = Colors.white;
  Key key = const Key('id');
  final box = GetStorage();
  var popupMenuItemIndex = 0;
  var currentIndex = 0.obs;
  bool isVisible = false;
  late FocusNode myFocusNode;

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 20.0,
            color: Colors.black,
          ),
          Text(title),
        ],
      ),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      popupMenuItemIndex = value;
    });

    if (value == Options.profile.index) {
      Get.toNamed('/ProfilSayfasi');
    } else if (value == Options.password.index) {
      Get.toNamed('/ChangePassword');
    } else if (value == Options.detail.index) {
      Get.toNamed('/ChangeUserDetail');
    } else {
      GetStorage().remove('id');
      GetStorage().remove('cookie');
      Get.offAllNamed('/');
    }
  }

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
    myFocusNode = FocusNode();
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

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(105.0),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                onPressed: (() => Get.offAllNamed('/')),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              title: Container(
                alignment: Alignment.center,
                height: 50,
                child: Image.asset(
                  'assets/tidislam-logo-3.png',
                  fit: BoxFit.contain,
                ),
              ),
              actions: [
                box.read('id') == null
                    ? TextButton(
                        onPressed: (() {
                          Get.toNamed('/GirisSayfasi');
                        }),
                        child: const Text(
                          'Giriş Yap',
                          style: TextStyle(color: Colors.white),
                        ))
                    : PopupMenuButton(
                        icon: const Icon(
                          FontAwesomeIcons.solidCircleUser,
                          color: Colors.teal,
                        ),
                        onSelected: (value) {
                          _onMenuItemSelected(value as int);
                        },
                        itemBuilder: (ctx) => [
                          _buildPopupMenuItem(
                            'Kullanıcı Bilgileri',
                            Icons.person_outline,
                            Options.profile.index,
                          ),
                          _buildPopupMenuItem(
                            'Bilgileri Güncelle',
                            Icons.update,
                            Options.detail.index,
                          ),
                          _buildPopupMenuItem(
                            'Şifre Değiştir',
                            Icons.change_circle_outlined,
                            Options.password.index,
                          ),
                          _buildPopupMenuItem(
                            'Çıkış Yap',
                            Icons.exit_to_app,
                            Options.exit.index,
                          ),
                        ],
                      )
              ],
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Anasayfa | $catDataTitle',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '| $catTitle',
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),

                //search bar
                Container(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 13.50, right: 13.50),
                  child: TextFormField(
                    focusNode: myFocusNode,
                    onTap: () => setState(() {
                      isVisible = true;
                    }),
                    onChanged: (value) {
                      if (value.isEmpty) {
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
                      filterSearchResults(editingController.text);
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
                              filterSearchResults(editingController.text);
                              myFocusNode.unfocus();
                              setState(() {
                                isVisible = false;
                              });
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
        return dataCatVideo == null
            ? const Text(
                'Video Bulunamadı',
                style: TextStyle(color: Colors.amber),
              )
            : VideoOynatici(
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

  void filterSearchResults(String value) {
    setState(() {
      dataCatVideo = dataCatVideo!
          .where((element) => element.title!.toLowerCase().contains(value))
          .toList();
    });
  }
}
