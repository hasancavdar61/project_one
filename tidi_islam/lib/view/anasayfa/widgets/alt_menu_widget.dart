import 'package:flutter/material.dart';

class AltMenu extends StatefulWidget {
  const AltMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<AltMenu> createState() => _AltMenuState();
}

class _AltMenuState extends State<AltMenu> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      /// [value] değeri [currentIndex] değerine eşitlenip her dokunmada güncelleniyor
      /// bu güncelleme sayfanın indexini değiştirdiği için sayfa değişiyor.
      onTap: (value) {
        setState(() {
          value = currentIndex;
        });
      },
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.teal,
      items: const [
        BottomNavigationBarItem(
          label: 'Anasayfa',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Favoriler',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'Soru-Cevap',
          icon: Icon(Icons.question_mark),
        ),
        BottomNavigationBarItem(
          label: 'İletişim',
          icon: Icon(Icons.mail),
        ),
      ],
    );
  }
}
