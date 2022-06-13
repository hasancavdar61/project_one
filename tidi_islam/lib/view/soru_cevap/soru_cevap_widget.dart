import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/modal_fit.dart';

class SoruCevapWidget extends StatefulWidget {
  SoruCevapWidget({Key? key}) : super(key: key);

  @override
  State<SoruCevapWidget> createState() => _SoruCevapWidgetState();

  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
}

class _SoruCevapWidgetState extends State<SoruCevapWidget> {
  ///Video dosyasını cihazdan almak ya da video çekmek için bu metod kullanılır.

  late bool _isVisible = false;
  File? video;
  File? videoKamera;

  final _picker = ImagePicker();

  Future<void> openVideoPicker() async {
    try {
      final XFile? secilenVideo =
          await _picker.pickVideo(source: ImageSource.gallery);
      if (secilenVideo != null) {
        setState(() {
          video = File(secilenVideo.path);
          _isVisible = true;
        });
        Navigator.pop(context);
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
          videoKamera = File(cekilenVideo.path);
          _isVisible = true;
        });
        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    ///Form yapısı ana widgeti [SingleChildScrollView]
    GetStorage box = GetStorage();
    return box.read('id') == null
        ? centerElevated(box, context)
        : singleChildSW(context);
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

  SingleChildScrollView singleChildSW(BuildContext context) {
    return SingleChildScrollView(
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
                    const CustomForm(
                      inputType: TextInputType.name,
                      topLabel: 'İSİM*',
                      formFieldLabel: 'İsminizi Giriniz',
                      maxAlan: 1,
                    ),
                    const CustomForm(
                      inputType: TextInputType.name,
                      topLabel: 'SOYİSİM*',
                      formFieldLabel: 'Soyisminizi Giriniz',
                      maxAlan: 1,
                    ),
                    const CustomForm(
                      inputType: TextInputType.emailAddress,
                      topLabel: 'E-POSTA*',
                      formFieldLabel: 'eposta@epostagiriniz.com',
                      maxAlan: 1,
                    ),
                    CustomForm(
                      mask: '# (###) ###-##-##',
                      filter: {"#": RegExp(r'[0-9]')},
                      inputType: TextInputType.phone,
                      topLabel: 'TELEFON*',
                      formFieldLabel: '0 (---) --- -- --',
                      maxAlan: 1,
                    ),
                    const CustomForm(
                      inputType: TextInputType.text,
                      topLabel: 'KONU BAŞLIĞI*',
                      formFieldLabel: 'Konu Başlığı Giriniz',
                      maxAlan: 1,
                    ),
                    const CustomForm(
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
              child: const Text('VİDEOUNUZU SEÇİNİZ*'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal)),
            ),
            // Bu yapı kullanılarak seçilen videonun ekranda gözükmesi olayı
            //seçim yapıldığında aktif olmaktadır.
            Visibility(
              visible: _isVisible,
              child: SizedBox(
                child: videoKamera != null
                    ? const Text('Video Kaydedildi',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.amber))
                    : const Text(
                        'Dosya Seçilmedi',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.amber),
                      ),
              ),
            ),

            /// Submit butonu [ElevatedButton]
            Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget._formKey.currentState!.validate();
                },
                child: const Text('SORUNUZU GÖNDERİN'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
