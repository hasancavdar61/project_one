import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tidi_islam/view/soru_cevap/soru_cevap_widget.dart';

class SoruCevapView extends ConsumerStatefulWidget {
  const SoruCevapView({Key? key}) : super(key: key);

  @override
  ConsumerState<SoruCevapView> createState() => _SoruCevapViewState();
}

class _SoruCevapViewState extends ConsumerState<SoruCevapView> {
  @override
  Widget build(BuildContext context) {
    return SoruCevapWidget();
  }
}
