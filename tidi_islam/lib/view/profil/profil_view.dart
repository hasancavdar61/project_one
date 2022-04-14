library profil_view.dart;

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/modal_fit.dart';

part '../profil/profil_widget.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ProfilWidget(),
    );
  }
}
