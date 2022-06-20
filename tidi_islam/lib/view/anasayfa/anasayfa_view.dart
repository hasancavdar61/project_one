import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/constants/screen_list.dart';
import 'package:tidi_islam/view/anasayfa/widgets/yan_menu_widget.dart';

class AnasayfaView extends StatefulWidget {
  const AnasayfaView({Key? key}) : super(key: key);

  @override
  State<AnasayfaView> createState() => _AnasayfaViewState();
}

enum Menu { profilSayfasi, changePassword, itemThree }
enum Options { profile, password, detail, exit }

class _AnasayfaViewState extends State<AnasayfaView> {
  var currentIndex = 0.obs;
  final box = GetStorage();
  var popupMenuItemIndex = 0;

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: GestureDetector(
            onTap: () => currentIndex.value = 0,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              child: Image.asset(
                'assets/tid_logo.png',
                fit: BoxFit.contain,
              ),
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
                    icon: const Icon(Icons.person),
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
        ),

        /// [Drawer] yapısı [YanMenu] adında toplanmış atomic yapı sağlanmıştır.
        // ? Dinamikleştirme gerekebilir.
        drawer: const YanMenu(),

        /// [BottomNavigationBar] onTap metodu [currentIndex] durumuna bağlıdır.
        /// [BottomNavigationBar] içerisinde [BottomNavigationBarItem] kullanılmıştır.
        /// [BottomNavigationBarItem] içerisinde [Icon] ve [Text] kullanılmıştır.
        /// [Icon] içerisinde [FontAwesomeIcons] kullanılmıştır.
        bottomNavigationBar: Obx(
          (() => BottomNavigationBar(
                onTap: (value) {
                  currentIndex.value = value;
                },
                currentIndex: currentIndex.value,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 12.0,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.teal,
                items: const [
                  BottomNavigationBarItem(
                    label: 'Anasayfa',
                    icon: FaIcon(FontAwesomeIcons.houseChimney),
                  ),
                  BottomNavigationBarItem(
                    label: 'Hakkımızda',
                    icon: FaIcon(FontAwesomeIcons.circleInfo),
                  ),
                  BottomNavigationBarItem(
                    label: 'Favoriler',
                    icon: FaIcon(FontAwesomeIcons.heart),
                  ),
                  BottomNavigationBarItem(
                    label: 'Soru-Cevap',
                    icon: FaIcon(FontAwesomeIcons.question),
                  ),
                  BottomNavigationBarItem(
                    label: 'İletişim',
                    icon: FaIcon(FontAwesomeIcons.commentDots),
                  ),
                ],
              )),
        ),

        /// [Scaffold] yapısının [body] parametresi burada bulunur.
        /// Sayfa görüntülenmeleri [AnasayfaView] içerisinde bulunan,
        /// [BottomNavigationBar] tarafından kontrol edilmektedir. Bu kontroller
        /// [onTap] metoduyla set edilip kullanıcının [BottomNavigationBar]
        /// üzerindeki butonlara dokunma/tıklamasıyla tetiklenir ve gerekli
        /// sayfa ekrana gelir.
        /// [Scaffold] içerisinde [Drawer] yapısı kullanılmıştır.
        /// [Drawer] içerisinde [YanMenu] yapısı kullanılmıştır.
        /// [YanMenu] içerisinde [ListView] yapısı kullanılmıştır.
        /// [ListView] içerisinde [ListTile] yapısı kullanılmıştır.

        body: Obx(
          () => ScreenList().screens[currentIndex.value],
        ));
  }
}
/*
 TextButton(
              onPressed: box.read('id') == null
                  ? () => Get.toNamed('/GirisSayfasi')
                  : () => Get.toNamed('/ProfilSayfasi'),
              child: box.read('id') != null
                  ? const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Giriş Yap',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
 */

