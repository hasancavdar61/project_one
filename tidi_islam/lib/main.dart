import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/constants/theme.dart';
import 'package:tidi_islam/services/local_service.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_view.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();
  runApp(
    const ProviderScope(child: TidApp()),
  );
}

class TidApp extends StatefulWidget {
  const TidApp({
    Key? key,
  }) : super(key: key);

  @override
  State<TidApp> createState() => _TidAppState();
}

class _TidAppState extends State<TidApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      getPages: GetRouteService().routesGet,
      home: const Scaffold(
        body: AnasayfaView(),
      ),
      theme: AppTheme().themeData,
    );
  }
}
