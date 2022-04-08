import 'package:flutter/material.dart';

class AltMenu extends StatelessWidget {
  const AltMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
