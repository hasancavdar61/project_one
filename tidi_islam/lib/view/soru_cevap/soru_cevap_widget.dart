import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/soru_cevap_form.dart';

class SoruCevapWidget extends StatefulWidget {
  const SoruCevapWidget({Key? key}) : super(key: key);

  @override
  State<SoruCevapWidget> createState() => _SoruCevapWidgetState();
}

class _SoruCevapWidgetState extends State<SoruCevapWidget> {
  ///Video dosyasını cihazdan almak ya da video çekmek için bu metod kullanılır.
  //! try - catch bloğuna almayı unutma!!!!!!!!!--------
  File? _image;
  late bool _isVisible = false;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickVideo(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ///Form yapısı ana widgeti [SingleChildScrollView]

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 50.0,
            ),
            const Divider(
              height: 3,
              color: Colors.grey,
            ),
            Text(
              'SORULARINIZI VİDEO \n İLE BİZE ULAŞTIRIN',
              style: Theme.of(context).textTheme.headline4,
            ),

            ///Form yapısını tutan parent widget.
            Form(
              child: Column(
                children: const [
                  /// Custom yapıda bulunan [SoruCevap]
                  SoruCevapForm(
                    inputType: TextInputType.name,
                    topLabel: 'İSİM*',
                    formFieldLabel: 'İsminizi Giriniz',
                    maxAlan: 1,
                  ),
                  SoruCevapForm(
                    inputType: TextInputType.name,
                    topLabel: 'SOYİSİM*',
                    formFieldLabel: 'Soyisminizi Giriniz',
                    maxAlan: 1,
                  ),
                  SoruCevapForm(
                    inputType: TextInputType.emailAddress,
                    topLabel: 'E-POSTA*',
                    formFieldLabel: 'eposta@epostagiriniz.com',
                    maxAlan: 1,
                  ),
                  SoruCevapForm(
                    inputType: TextInputType.phone,
                    topLabel: 'TELEFON*',
                    formFieldLabel: '0 (---) --- -- --',
                    maxAlan: 1,
                  ),
                  SoruCevapForm(
                    inputType: TextInputType.text,
                    topLabel: 'KONU BAŞLIĞI*',
                    formFieldLabel: 'Konu Başlığı Giriniz',
                    maxAlan: 1,
                  ),
                  SoruCevapForm(
                    inputType: TextInputType.text,
                    topLabel: 'KONU*',
                    formFieldLabel: 'Sorunuzu Giriniz',
                    maxAlan: 6,
                  ),
                ],
              ),
            ),

            /// [ElevatedButton] -> [onPressed] metodu [_openImagePicker] metodunu
            /// kullanarak video seçim ekranını açmakta.
            //! Bottomsheet yapısını kullan.
            ElevatedButton(
              onPressed: _openImagePicker,
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
                width: 100,
                height: 100,
                child: _image != null
                    ? Image.file(_image!)
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
                onPressed: () {},
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
