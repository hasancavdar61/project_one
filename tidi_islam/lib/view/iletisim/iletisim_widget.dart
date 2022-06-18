import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tidi_islam/services/services.dart';

class IletisimWidget extends ConsumerStatefulWidget {
  const IletisimWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IletisimWidget();
}

class _IletisimWidget extends ConsumerState<IletisimWidget> {
  @override
  void initState() {
    Service().menuCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'İletişim',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
