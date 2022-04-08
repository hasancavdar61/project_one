import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoOynatici extends StatelessWidget {
  const VideoOynatici({Key? key, this.embedCode}) : super(key: key);

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

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Stack(
        children: [
          /// Favori ikonu
          Positioned(
            right: 1,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Favorilere başarıyla kaydedildi.'),
                  ),
                );
              },
              child: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.red,
              ),
            ),
          ),

          /// Video thumbnnail ve play butonu
          GestureDetector(
            onTap: () {
              showVideoDialog(context, _controller);
            },
            child: Row(
              children: [
                Stack(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Image.network(
                        'https://i3.ytimg.com/vi/$embedCode/maxresdefault.jpg'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Video Adı',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Video kategorisi adı',
                        maxLines: 4,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

showVideoDialog(BuildContext context, YoutubePlayerController _controller) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Video Adı',
      ),
      content: YoutubePlayerIFrame(
        controller: _controller,
        aspectRatio: 16 / 9,
      ),
    ),
  );
}
