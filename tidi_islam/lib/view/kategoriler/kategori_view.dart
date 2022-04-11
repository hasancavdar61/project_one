import 'package:flutter/material.dart';
import 'package:tidi_islam/view/kategoriler/kategori_widget.dart';

class KategoriView extends StatefulWidget {
  const KategoriView({Key? key}) : super(key: key);

  @override
  State<KategoriView> createState() => _KategoriViewState();
}

class _KategoriViewState extends State<KategoriView> {
  @override
  Widget build(BuildContext context) {
    return const KategoriWidget();
  }
}
