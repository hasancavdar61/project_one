part of 'profil_view.dart';

class ProfilWidget extends StatefulWidget {
  const ProfilWidget({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  State<ProfilWidget> createState() => _ProfilWidgetState();
}

class _ProfilWidgetState extends State<ProfilWidget> {
  ///Video dosyasını cihazdan almak ya da video çekmek için bu metod kullanılır.
  //! try - catch bloğuna almayı unutma!!!!!!!!!--------
  final bool _isVisible = false;
  late final bool _isReadOnly = true;
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

            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.userModel.firstname.toString()[0].toUpperCase() +
                      widget.userModel.lastname.toString()[0].toUpperCase(),
                  style: const TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ),
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
                      formFieldLabel: widget.userModel.firstname!.toUpperCase(),
                      maxAlan: 1,
                    ),
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.name,
                      topLabel: 'SOYİSİM*',
                      formFieldLabel: widget.userModel.lastname!.toUpperCase(),
                      maxAlan: 1,
                    ),

                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.phone,
                      topLabel: 'TELEFON*',
                      formFieldLabel: widget.userModel.telephone,
                      maxAlan: 1,
                    ),
                    CustomForm(
                      isReadOnly: _isReadOnly,
                      inputType: TextInputType.emailAddress,
                      topLabel: 'E-POSTA*',
                      formFieldLabel: widget.userModel.email,
                      maxAlan: 1,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal)),
                  onPressed: () {
                    Get.toNamed('/ChangePassword');
                  },
                  child: const Text('ŞİFRE DEĞİŞTİR'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal)),
                  onPressed: () {
                    Get.toNamed('/ChangeUserDetail');
                  },
                  child: const Text('BİLGİLERİ GÜNCELLE'),
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}

/**
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
 */