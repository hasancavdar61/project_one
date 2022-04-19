import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final RxInt currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
              icon: FaIcon(
                FontAwesomeIcons.houseChimney,
              ),
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
            BottomNavigationBarItem(
              label: 'Hakkımızda',
              icon: FaIcon(FontAwesomeIcons.circleInfo),
            ),
          ],
        );
  }
}
