import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tidi_islam/riverpod/home_riverpod.dart';
import 'package:tidi_islam/riverpod/login_riverpod.dart';
import 'package:tidi_islam/view/iletisim/iletisim_widget.dart';

final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
final homeRiverpod = ChangeNotifierProvider((_) => HomeRiverpod());
