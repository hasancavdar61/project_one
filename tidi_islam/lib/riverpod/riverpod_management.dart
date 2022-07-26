import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tidi_islam/riverpod/change_user_riverpod.dart';
import 'package:tidi_islam/riverpod/changepass_riverpod.dart';
import 'package:tidi_islam/riverpod/home_riverpod.dart';
import 'package:tidi_islam/riverpod/iletisim_form_riverpod.dart';
import 'package:tidi_islam/riverpod/login_riverpod.dart';
import 'package:tidi_islam/riverpod/register_riverpod.dart';
import 'package:tidi_islam/riverpod/soru_cevap_riverpod.dart';
import 'package:tidi_islam/riverpod/user_profile_riverpod.dart';

//! Tüm riverpod dosyalarının yönetimi buradan gerçekleşmektedir.

final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
final homeRiverpod = ChangeNotifierProvider((_) => HomeRiverpod());
final changePassRiverpod = ChangeNotifierProvider((_) => ChangePassRiverpod());
final changeUserRiverpod = ChangeNotifierProvider((_) => ChangeUserRiverpod());
final registerRiverpod = ChangeNotifierProvider((_) => RegisterRiverpod());
final sorucevapRiverpod = ChangeNotifierProvider((_) => SoruCevapRiverpod());
final sorucevapUPRiverpod = ChangeNotifierProvider((_) => SoruCevapUPRiverpod());
final iletisimFormRiverpod = ChangeNotifierProvider((_) => IletisimFormRiverpod());
