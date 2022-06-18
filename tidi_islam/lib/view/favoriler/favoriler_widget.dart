import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
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
    return state.data!.isEmpty
        ? const Center(
            child: Text(
              'Henüz favori eklemediniz',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        : ListView.builder(
            itemBuilder: ((context, index) {
              return VideoOynatici(
                embedCode: state.data?[index].embed,
                topTitle: state.data?[index].title,
                bottomTitle: state.data?[index].description,
                imageUrl: state.data?[index].image,
              );
            }),
            itemCount: state.data?.length);
  }
}
