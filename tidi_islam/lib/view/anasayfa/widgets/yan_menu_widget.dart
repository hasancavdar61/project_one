import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';

class YanMenu extends ConsumerStatefulWidget {
  const YanMenu({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<YanMenu> createState() => _YanMenuState();
}

class _YanMenuState extends ConsumerState<YanMenu> {
  @override
  void initState() {
    ref.read(homeRiverpod).fetchMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeRiverpod);
    return Drawer(
      backgroundColor: Colors.teal,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(14.0),
            color: Colors.teal.shade600,
            child: const Text(
              'MENÜLERİMİZ',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ExpansionTile(
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      title: Text(
                        state.dataModel![index].title!.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              transform: const GradientRotation(pi / 90),
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.grey.withOpacity(0.0),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 8,
                                blurRadius: 10,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.black87,
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      'ALT MENÜ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 18.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, indexx) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/KategoriSayfasi',
                                          arguments: [
                                            state.dataModel![index]
                                                .parent![indexx].href,
                                            state.dataModel![index].title,
                                            state.dataModel![index]
                                                .parent![indexx].title
                                          ]);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade400)),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(14.0),
                                      child: Text(state.dataModel![index]
                                          .parent![indexx].title!
                                          .toUpperCase()),
                                    ),
                                  );
                                }),
                                itemCount:
                                    state.dataModel?[index].parent!.length,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
              itemCount: state.dataModel?.length ?? 0),
        ],
      ),
    );
  }
}
