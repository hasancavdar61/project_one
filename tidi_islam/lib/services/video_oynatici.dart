import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoOynatici extends StatefulWidget {
  const VideoOynatici({
    Key? key,
    this.embedCode,
    this.topTitle,
    this.bottomTitle,
    this.imageUrl,
    this.id,
    this.color,
  }) : super(key: key);

  final String? embedCode;
  final String? topTitle;
  final String? bottomTitle;
  final String? imageUrl;
  final String? id;
  final Color? color;

  @override
  State<VideoOynatici> createState() => _VideoOynaticiState();
}

class _VideoOynaticiState extends State<VideoOynatici> {
  String favoriTitle = 'Favori işlemi başarılı';
  String base = 'https://i3.ytimg.com/vi//maxresdefault.jpg';
  String baseUrl = 'https://www.tidislam.com';

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: OctoImage(
                      errorBuilder: (context, error, stackTrace) => const Text(
                        'Görsel bulunamadı.',
                        style: TextStyle(color: Colors.white),
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
                    left: 60,
                    right: 60,
                    top: 30,
                    bottom: 30,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.7),
                          shape: BoxShape.circle),
                    ),
                  ),
                  // play butonu
                  Positioned(
                    left: 1,
                    right: 1,
                    top: 1,
                    bottom: 1,
                    child: IconButton(
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () => showVideoDialog(context, _controller),
                    ),
                  ),
                ]),
                const SizedBox(
                  width: 10.0,
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
                      const SizedBox(
                        height: 10,
                      ),
                      AutoSizeText.rich(
                        TextSpan(text: widget.bottomTitle),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxFontSize: 10,
                        minFontSize: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Favori ikonu
          Positioned(
            left: 3,
            top: 3,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(favoriTitle),
                  ),
                );
              },
              child: Icon(
                Icons.favorite,
                color: widget.color,
              ),
            ),
          ),
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

/**
 * 
 * YoutubePlayerIFrame(
        controller: _controller,
        aspectRatio: 16 / 9,
      )
 * class VideoGrid extends StatelessWidget {
  const VideoGrid({Key? key, this.embedCode}) : super(key: key);

  final String? embedCode;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: embedCode!,
      params: const YoutubePlayerParams(
        startAt: Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: OctoImage(
                  errorBuilder: (context, error, stackTrace) => const Text(
                    'Bir sorun oluştu.',
                    style: TextStyle(color: Colors.white),
                  ),
                  image: NetworkImage(
                    'https://i3.ytimg.com/vi/$embedCode/maxresdefault.jpg',
                  ),
                  placeholderBuilder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                      backgroundColor: Colors.teal,
                    ),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 14.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Video Adı',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.only(left: 14.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Video Kategorisi Adı',
                  style: TextStyle(color: Colors.grey.shade400),
                ),
              ),
            ],
          ),
          const Positioned(
            left: 10,
            top: 10,
            child: Icon(Icons.favorite),
          ),
          Positioned(
            left: 1,
            top: 42,
            right: 1,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.7), shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}

 */
