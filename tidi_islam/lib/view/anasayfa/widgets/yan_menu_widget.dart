import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/view/anasayfa/widgets/expansion_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class YanMenu extends ConsumerStatefulWidget {
  const YanMenu({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<YanMenu> createState() => _YanMenuState();
}

final Uri _url = Uri.parse('https://www.tidislam.com/');
String urrl = 'https://www.tidislam.com/';
void _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(urrl + url))) throw 'Could not launch $_url';
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
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return ExpansionMenu(
                  kategoriAdi: state.dataModel?[index].title!.toUpperCase(),
                  otherChild: Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) => Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade400)),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(14.0),
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) => Text(
                                    state.dataModel![index].parent![0].title!)),
                                itemCount:
                                    state.dataModel![index].parent!.length,
                              ),
                            )),
                        itemCount: state.dataModel?[index].parent!.length),
                  ),
                );
              }),
              itemCount: state.dataModel?.length ?? 0),
        ],
      ),
    );
  }
}
