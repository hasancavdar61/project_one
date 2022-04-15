part of 'profil_view.dart';

class ProfilWidget extends StatefulWidget {
  const ProfilWidget({Key? key}) : super(key: key);

  @override
  State<ProfilWidget> createState() => _ProfilWidgetState();
}

class _ProfilWidgetState extends State<ProfilWidget> {
  ///Video dosyasını cihazdan almak ya da video çekmek için bu metod kullanılır.
  //! try - catch bloğuna almayı unutma!!!!!!!!!--------
  final bool _isVisible = false;
  late bool _isReadOnly = true;
  File? fotograf;
  File? fotografKamera;

  final _picker = ImagePicker();

  Future<void> openPhotoPicker() async {
    try {
      final XFile? secilenFotograf =
          await _picker.pickImage(source: ImageSource.gallery);
      if (secilenFotograf != null) {
        setState(() {
          fotograf = File(secilenFotograf.path);
        });
        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> openPhotoTaker() async {
    try {
      final XFile? cekilenFotograf =
          await _picker.pickImage(source: ImageSource.camera);
      if (cekilenFotograf != null) {
        setState(() {
          fotografKamera = File(cekilenFotograf.path);
        });
        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'KULLANICI BİLGİLERİ',
              style: Theme.of(context).textTheme.headline4,
            ),

            ///Form yapısını tutan parent widget.
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                child: Column(
                  children: [
                    /// Custom yapıda bulunan [SoruCevap]
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.name,
                      topLabel: 'İSİM*',
                      formFieldLabel: 'DAYNEX',
                      maxAlan: 1,
                    ),
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.name,
                      topLabel: 'SOYİSİM*',
                      formFieldLabel: 'EDİTÖR KULLANICISI',
                      maxAlan: 1,
                    ),
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.name,
                      topLabel: 'İL*',
                      formFieldLabel: 'TRABZON',
                      maxAlan: 1,
                    ),
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.name,
                      topLabel: 'İLÇE*',
                      formFieldLabel: 'ORTAHİSAR',
                      maxAlan: 1,
                    ),
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.phone,
                      topLabel: 'TELEFON*',
                      formFieldLabel: '0 (---) --- -- --',
                      maxAlan: 1,
                    ),
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.emailAddress,
                      topLabel: 'E-POSTA*',
                      formFieldLabel: 'eposta@epostagiriniz.com',
                      maxAlan: 1,
                    ),

                    CustomForm(
                      isReadOnly: _isReadOnly,
                      isObsecure: true,
                      inputType: TextInputType.visiblePassword,
                      topLabel: 'ŞİFRE*',
                      formFieldLabel: 'Şifre Giriniz',
                      maxAlan: 1,
                    ),
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      isObsecure: true,
                      inputType: TextInputType.visiblePassword,
                      topLabel: 'ŞİFRE TEKRAR*',
                      formFieldLabel: 'Şifreyi Tekrar Giriniz',
                      maxAlan: 1,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: SizedBox(
                child: fotograf != null
                    ? const Text('Fotoğraf Kaydedildi',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.amber))
                    : const Text(
                        'Dosya Seçilmedi',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.amber),
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => ModalFit(
                    pickerLabel: 'Fotoğraf Seç',
                    takerLabel: 'Fotoğraf Çek',
                    videoSec: openPhotoPicker,
                    videoCek: openPhotoTaker,
                  ),
                );
              },
              child: const Text('FOTOĞRAF SEÇİNİZ*'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isReadOnly == true
                      ? _isReadOnly = false
                      : _isReadOnly = true;
                });
              },
              child: const Text('Düzenle'),
            ),

            /// Submit butonu [ElevatedButton]
            Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('ÜYELİK FORMUNU GÖNDER'),
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
