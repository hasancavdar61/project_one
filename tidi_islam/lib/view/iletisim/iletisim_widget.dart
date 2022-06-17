import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tidi_islam/model/home_model.dart';

class IletisimWidget extends ConsumerStatefulWidget {
  const IletisimWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IletisimWidget();
}

class _IletisimWidget extends ConsumerState<IletisimWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<HomeSlider>(
        future: fetchSlider(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Image.network(
                        'https://www.tidislam.com' +
                            snapshot.data!.slider![index].mobilImage.toString(),
                        fit: BoxFit.cover,
                      ),
                      tileColor: Colors.teal,
                      title: Text(
                        snapshot.data!.slider![index].mobilImage.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: const Text(''),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              }),
              itemCount: snapshot.data!.slider!.length,
            );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
              style: const TextStyle(color: Colors.amber),
            );
          }

          // By default, show a loading spinner.
          return const Text(
            'İletişim',
            style: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }

  fetchSlider() {}
}
