part of 'profil_view.dart';

class ProfilWidget extends StatefulWidget {
  const ProfilWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  final UserModel userModel;

  @override
  State<ProfilWidget> createState() => _ProfilWidgetState();
}

class _ProfilWidgetState extends State<ProfilWidget> {
  ///Video dosyasını cihazdan almak ya da video çekmek için bu metod kullanılır.
  //! try - catch bloğuna almayı unutma!!!!!!!!!--------
  final bool _isVisible = false;
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
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Text(
              'KULLANICI BİLGİLERİ',
              style: Theme.of(context).textTheme.headline4,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: widget.userModel.image == ""
                  ? Container(
                      decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        widget.userModel.firstname.toString()[0].toUpperCase() +
                            widget.userModel.lastname
                                .toString()[0]
                                .toUpperCase(),
                        style: const TextStyle(
                            fontSize: 30.0, color: Colors.white),
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height / 4.8,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            'https://www.tidislam.com/upload/users/' +
                                widget.userModel.image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
            ),

            ///Form yapısını tutan parent widget.
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Custom yapıda bulunan [SoruCevap]
                    ShowerContainer(
                      topLabel: 'İSİM*',
                      formFieldLabel: widget.userModel.firstname!.toUpperCase(),
                    ),

                    ShowerContainer(
                      topLabel: 'SOYİSİM*',
                      formFieldLabel: widget.userModel.lastname!.toUpperCase(),
                    ),
                    ShowerContainer(
                      topLabel: 'TELEFON*',
                      formFieldLabel: widget.userModel.telephone!.toUpperCase(),
                    ),

                    ShowerContainer(
                      topLabel: 'E-POSTA*',
                      formFieldLabel: widget.userModel.email!,
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
          ],
        ),
      ),
    );
  }
}
