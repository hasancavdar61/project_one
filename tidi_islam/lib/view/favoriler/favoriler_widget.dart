import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/riverpod/home_riverpod.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/tablet_oynatici.dart';
import 'package:tidi_islam/services/video_oynatici.dart';

class FavorilerWidget extends ConsumerStatefulWidget {
  const FavorilerWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<FavorilerWidget> createState() => _FavorilerWidgetState();
}

class _FavorilerWidgetState extends ConsumerState<FavorilerWidget> {
  @override
  void initState() {
    ref.read(homeRiverpod).fetchFavoritelist();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeRiverpod);
    if (GetStorage().read('id') == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Favori eklemek için giriş yapmanız gerekmektedir.',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed('/GirisSayfasi'),
            child: const Text('Giriş Yap'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
            ),
          )
        ],
      );
    } else if (state.data!.isEmpty) {
      return const Center(
        child: Text(
          'Henüz favori eklemediniz',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
    } else {
      return RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.teal,
        onRefresh: () async {
          if (mounted) {
            setState(() {
              ref.read(homeRiverpod).fetchFavoritelist();
            });
          }
        },
        child: context.isTablet ? videoGridF(state) : videoListF(state),
      );
    }
  }

  ListView videoListF(HomeRiverpod state) {
    return ListView.builder(
        itemBuilder: ((context, index) {
          return VideoOynatici(
            id: state.data![index].id,
            embedCode: state.data?[index].embed,
            topTitle: state.data?[index].title,
            bottomTitle: state.data?[index].description,
            imageUrl: state.data?[index].image,
            iconColor: GetStorage().read(state.data![index].id.toString()) ==
                    state.data![index].id
                ? Colors.red
                : Colors.black,
                
          );
        }),
        itemCount: state.data?.length);
  }

  GridView videoGridF(HomeRiverpod state) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: ((context, index) {
          return TabletOynatici(
            id: state.data![index].id,
            embedCode: state.data?[index].embed,
            topTitle: state.data?[index].title,
            bottomTitle: state.data?[index].description,
            imageUrl: state.data?[index].image,
            iconColor: GetStorage().read(state.data![index].id.toString()) ==
                    state.data![index].id
                ? Colors.red
                : Colors.black,
          );
        }),
        itemCount: state.data?.length);
  }
}
