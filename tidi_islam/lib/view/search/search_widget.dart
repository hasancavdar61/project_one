import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/model/search_model.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/services/tablet_oynatici.dart';
import 'package:tidi_islam/services/video_oynatici.dart';

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  var searchParam = Get.arguments[0];
  List<Product>? data = [];

  @override
  void initState() {
    ref.read(homeRiverpod).fetchSearch();
    Service().searchCall(search: searchParam).then((value) {
      setState(() {
        data = value?.products;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.offAllNamed('/'),
        ),
        title: const Text('Arama Sonuçları'),
      ),
      body: FutureBuilder(
          future: Service().searchCall(search: searchParam),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return context.isTablet ? videoGridF() : videoListF();
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'Arama Sonucu Bulunamadı',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  ListView videoListF() {
    return ListView.builder(
        itemBuilder: ((context, index) {
          return VideoOynatici(
            id: data![index].id,
            embedCode: data?[index].embed,
            topTitle: data?[index].title,
            bottomTitle: data?[index].description,
            imageUrl: data?[index].image,
            iconColor:
                GetStorage().read(data![index].id.toString()) == data![index].id
                    ? Colors.red
                    : Colors.black,
          );
        }),
        itemCount: data!.length);
  }

  GridView videoGridF() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: ((context, index) {
          return TabletOynatici(
            id: data![index].id,
            embedCode: data?[index].embed,
            topTitle: data?[index].title,
            bottomTitle: data?[index].description,
            imageUrl: data?[index].image,
            iconColor:
                GetStorage().read(data![index].id.toString()) == data![index].id
                    ? Colors.red
                    : Colors.black,
          );
        }),
        itemCount: data?.length);
  }
}
