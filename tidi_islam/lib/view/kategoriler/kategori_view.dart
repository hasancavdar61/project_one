import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/view/anasayfa/widgets/alt_menu_widget.dart';
import 'package:tidi_islam/view/anasayfa/widgets/yan_menu_widget.dart';

class KategoriView extends StatefulWidget {
  const KategoriView({Key? key}) : super(key: key);

  @override
  State<KategoriView> createState() => _KategoriViewState();
}

class _KategoriViewState extends State<KategoriView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TİDİSLAM'),
        actions: [
          TextButton(
            onPressed: () => Get.toNamed('/KategoriSayfasi'),
            child: const Text(
              'Giriş Yap',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: const YanMenu(),
      bottomNavigationBar: const AltMenu(),
    );
  }
}
