import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:octo_image/octo_image.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

//! Tablet Oynatici tablet için responsive video oynatıcısı.

class TabletOynatici extends ConsumerStatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TabletOynatici(
      {Key? key,
      this.embedCode,
      this.topTitle,
      this.bottomTitle,
      this.imageUrl,
      this.id,
      this.iconColor})
      : super(key: key);

  final String? embedCode;
  final String? topTitle;
  final String? bottomTitle;
  final String? imageUrl;
  final String? id;
  late final Color? iconColor;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabletOynaticiState();
}

class _TabletOynaticiState extends ConsumerState<TabletOynatici> {
  String favoriTitle = 'Favori işlemi başarılı';
  String base = 'https://i3.ytimg.com/vi//maxresdefault.jpg';
  String baseUrl = 'https://www.tidislam.com';
  Service service = Service();
  bool? isFavorite;
  Color color = Colors.black;
  List idList = [];

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.embedCode!,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Stack(
        children: [
          /// Video thumbnnail ve play butonu
          GestureDetector(
            onTap: () {
              showVideoDialog(context, _controller);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: OctoImage(
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Text(
                          'Görsel hazırlanıyor...',
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                      image: NetworkImage(
                        baseUrl + widget.imageUrl!,
                      ),
                      placeholderBuilder: (context) => const Center(
                          child: SpinKitCubeGrid(
                        color: Colors.red,
                      )),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.play_circle_outline,
                        color: Colors.red,
                        size: 40.0,
                      ),
                      onPressed: () {
                        showVideoDialog(context, _controller);
                      },
                    ),
                  )
                ]),
                const SizedBox(
                  height: 15.0,
                ),

                /// !Video adı ve Kategori adı
                Expanded(
                  child: Column(
                    children: [
                      AutoSizeText.rich(
                        TextSpan(text: widget.topTitle!),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        minFontSize: 5,
                      ),
                      AutoSizeText.rich(
                        TextSpan(text: widget.bottomTitle),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxFontSize: 9,
                        minFontSize: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Favori ikonu
          GetStorage().read('id') != null
              ? Positioned(
                  left: 3,
                  top: 3,
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        await service
                            .favoriCheck(videoId: widget.id!)
                            .then((value) async {
                          if (value.status == true) {
                            await service.removeFavouriteCall(id: widget.id!);
                            GetStorage().remove(widget.id!);

                            setState(() {
                              widget.iconColor = Colors.black;
                              isFavorite = false;
                            });
                          } else {
                            await service.addFavouriteCall(id: widget.id!);
                            GetStorage().write(widget.id!, widget.id!);

                            setState(() {
                              widget.iconColor = Colors.red;
                              isFavorite = true;
                            });
                          }
                        });
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    child: Icon(
                      Icons.favorite,
                      color: widget.iconColor ?? color,
                    ),
                  ),
                )
              : const Text(''),
        ],
      ),
    );
  }
}

//---------------------------------------------------------------

/// Video dialog çalışmasını sağlayan metod.
showVideoDialog(BuildContext context, YoutubePlayerController _controller) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(5),
      content: YoutubePlayerIFrame(
        controller: _controller,
        aspectRatio: 16 / 9,
      ),
    ),
  );
}
