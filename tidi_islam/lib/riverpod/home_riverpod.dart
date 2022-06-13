import 'package:flutter/material.dart';
import 'package:tidi_islam/model/home_model.dart';
import 'package:tidi_islam/services/services.dart';

class HomeRiverpod extends ChangeNotifier {
  List<Product>? datas = [];
  final service = Service();
  bool isLoading = false;
}
