import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/modal_fit.dart';
import 'package:video_player/video_player.dart';

class SoruCevapWidget extends ConsumerStatefulWidget {
  SoruCevapWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<SoruCevapWidget> createState() => _SoruCevapWidgetState();

  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
}

class _SoruCevapWidgetState extends ConsumerState<SoruCevapWidget> {
  ///Video dosyasını cihazdan almak ya da video çekin bu metod kullanılır.

  bool isLoading = false;

  String isSelectedText = 'VİDEONUZU SEÇİNİZ*';

  final flag = true.obs;

  bool isVisible = true;

  late VideoPlayerController controller;

  newUpload() async {
    setState(() {
      isLoading = true;
    });

    FTPConnect ftpConnect =
        FTPConnect('www.tidislam.com', user: 'tidislam', pass: '_XYVnqpjnsxP');
    File fileToUpload = File(video!.path);
    await ftpConnect.connect();
    await ftpConnect.changeDirectory('/public_html/upload/user_id/');
    await ftpConnect.makeDirectory('user${GetStorage().read('id').toString()}');
    await ftpConnect.changeDirectory(
        '/public_html/upload/user_id/user${GetStorage().read('id').toString()}');

    bool res =
        await ftpConnect.uploadFileWithRetry(fileToUpload, pRetryCount: 2);
    await ftpConnect.disconnect();
    debugPrint(res.toString());

    setState(() {
      isLoading = false;
      isSelectedText = 'VİDEO GÖNDERİLDİ';
    });
  }

  File? video;
  File? videoKamera;
  final videoInfo = FlutterVideoInfo();
  bool? isUploaded = false;
  String? name;
  String? surname;
  String? telephone;
  String? email;

  final _picker = ImagePicker();

  Future<void> openVideoPicker() async {
    try {
      var secilenVideo = await _picker.pickVideo(source: ImageSource.gallery);

      if (secilenVideo != null) {
        setState(() {
          video = File(secilenVideo.path);
          isSelectedText = 'VİDEO SEÇİLDİ';
        });
        Navigator.pop(context);

        debugPrint(secilenVideo.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> openVideoTaker() async {
    try {
      final XFile? cekilenVideo =
          await _picker.pickVideo(source: ImageSource.camera);
      if (cekilenVideo != null) {
        setState(() {
          video = File(cekilenVideo.path);
          isSelectedText = 'VİDEO SEÇİLDİ';
        });
        Navigator.pop(context);

        debugPrint(cekilenVideo.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    Service().userCall().then((value) {
      setState(() {
        name = value.firstname;
        surname = value.lastname;
        email = value.email;
        telephone = value.telephone;
      });
    });
    controller = VideoPlayerController.network(
        'https://res.cloudinary.com/dzhja2as9/video/upload/v1659011791/soru-ve-cevap-erkek_iqocay.mp4')
      ..initialize().then((_) {})
      ..setVolume(0.0);
    // video durduğunda görünürlüğü false yapar.
    controller.addListener(() {
      if (isVisible && !controller.value.isPlaying) {
        setState(() {
          isVisible = false;
          controller.pause();
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///Form yapısı ana widgeti [SingleChildScrollView]
    GetStorage box = GetStorage();
    return RefreshIndicator(
      child: box.read('id') == null
          ? centerElevated(box, context)
          : FutureBuilder(
              future: Service().userCall(),
              builder: (context, snapshot) {
                //Video oynatımı
                controller.play();

                if (snapshot.hasData) {
                  return singleChildSW(context);
                } else {
                  return Center(
                    child: SpinKitPumpingHeart(
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child:
                                Image.asset('assets/tidislam-logo-splash.png'));
                      },
                    ),
                  );
                }
              }),
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {});
      },
    );
  }

  Center centerElevated(GetStorage box, BuildContext context) {
    return Center(
        child: box.read('id') == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Soru-Cevap bölümü için giriş yapmanız gerekmektedir.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () => Get.toNamed('/GirisSayfasi'),
                    child: const Text('Giriş Yap'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                    ),
                  )
                ],
              )
            : singleChildSW(context));
  }

  Stack singleChildSW(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Text(
                  'SORULARINIZI VİDEO \n İLE BİZE ULAŞTIRIN',
                  style: Theme.of(context).textTheme.headline4,
                ),

                ///Form yapısını tutan parent widget.
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Form(
                    key: widget._formKey,
                    child: Column(
                      children: [
                        /// Custom yapıda bulunan [SoruCevap]
                        CustomForm(
                          initalValue: name,
                          inputType: TextInputType.name,
                          topLabel: 'İSİM*',
                          formFieldLabel: name,
                          maxAlan: 1,
                        ),
                        CustomForm(
                          initalValue: surname,
                          inputType: TextInputType.name,
                          topLabel: 'SOYİSİM*',
                          formFieldLabel: surname,
                          maxAlan: 1,
                        ),
                        CustomForm(
                          initalValue: email,
                          inputType: TextInputType.emailAddress,
                          topLabel: 'E-POSTA*',
                          formFieldLabel: email,
                          maxAlan: 1,
                        ),
                        CustomForm(
                          initalValue: telephone,
                          mask: '###########',
                          filter: {"#": RegExp(r'[0-9]')},
                          inputType: TextInputType.phone,
                          topLabel: 'TELEFON*',
                          formFieldLabel: telephone,
                          maxAlan: 1,
                        ),
                        CustomForm(
                          controller: ref.read(sorucevapRiverpod).konu,
                          inputType: TextInputType.text,
                          topLabel: 'KONU BAŞLIĞI*',
                          formFieldLabel: 'Konu Başlığı Giriniz',
                          maxAlan: 1,
                        ),
                        CustomForm(
                          controller: ref.read(sorucevapRiverpod).aciklama,
                          inputType: TextInputType.text,
                          topLabel: 'KONU*',
                          formFieldLabel: 'Sorunuzu Giriniz',
                          maxAlan: 6,
                        ),
                      ],
                    ),
                  ),
                ),

                /// [ElevatedButton] -> [onPressed] metodu [_openImagePicker] metodunu
                /// kullanarak video seçim ekranını açmakta.
                //! Bottomsheet yapısını kullan.
                ElevatedButton(
                  onPressed: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => ModalFit(
                        pickerLabel: 'Video Seç',
                        takerLabel: 'Video Çek',
                        videoSec: openVideoPicker,
                        videoCek: openVideoTaker,
                      ),
                    );
                  },
                  child: Text(isSelectedText),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal)),
                ),
                const SizedBox(
                  width: 10,
                ),
                // Bu yapı kullanılarak seçilen videonun ekranda gözükmesi olayı
                //seçim yapıldığında aktif olmaktadır.
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Visibility(
                    visible: isLoading,
                    child: SizedBox(
                      child: video != null
                          ? const Text(
                              'Soru gönderildi, video yükleme işlemi devam ediyor...',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.amber))
                          : const Text(
                              'Dosya Seçilmedi',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.amber),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Visibility(
                  visible: isLoading,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),

                /// Submit butonu [ElevatedButton]
                Container(
                  padding: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      ref.read(sorucevapRiverpod).name = name;
                      ref.read(sorucevapRiverpod).surname = surname;
                      ref.read(sorucevapRiverpod).email = email;
                      ref.read(sorucevapRiverpod).telephone = telephone;
                      ref.read(sorucevapRiverpod).videoname =
                          video?.path == null
                              ? ''
                              : video!.path.split('/').last;

                      if (widget._formKey.currentState!.validate() &&
                          video?.path != null) {
                        ref.read(sorucevapRiverpod).fetchSoruCevap();
                        await newUpload();
                      } else {
                        ref.read(sorucevapRiverpod).fetchSoruCevap();
                      }
                    },
                    child: const Text('SORUNUZU GÖNDERİN'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.teal)),
                  ),
                ),
              ],
            ),
          ),
        ),
        context.isTablet ? visibleTablet() : visiblePhone(),
      ],
    );
  }

  Visibility visiblePhone() {
    return Visibility(
      visible: isVisible,
      child: Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }

  Visibility visibleTablet() {
    return Visibility(
      visible: isVisible,
      child: Positioned(
        bottom: 0,
        right: 0,
        child: SizedBox(
          height: Get.height / 2,
          width: Get.width / 1.6,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
