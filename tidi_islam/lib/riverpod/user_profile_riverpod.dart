import 'package:flutter/material.dart';
import 'package:tidi_islam/services/services.dart';

class SoruCevapUPRiverpod extends ChangeNotifier {
  final service = Service();

  String? name;
  String? surname;
  String? telephone;
  String? email;

  fetchUser() async {
    await service.userCall().then((value) {
      name = value.firstname;
      surname = value.lastname;
      telephone = value.telephone;
      email = value.email;
    });
  }
}
