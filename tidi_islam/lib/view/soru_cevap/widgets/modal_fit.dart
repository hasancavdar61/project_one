import 'package:flutter/material.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key? key, this.videoSec, this.videoCek}) : super(key: key);

  final VoidCallback? videoSec;
  final VoidCallback? videoCek;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text('Video Seç'),
            leading: const Icon(Icons.folder_open),
            onTap: videoSec,
          ),
          ListTile(
            title: const Text('Video Çek'),
            leading: const Icon(Icons.photo_camera_front),
            onTap: videoCek,
          ),
          ListTile(
            title: const Text('İptal'),
            leading: const Icon(Icons.cancel_outlined),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    ));
  }
}
