import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/view/iletisim/widgets/adres_widget.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class IletisimWidget extends ConsumerStatefulWidget {
  const IletisimWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IletisimWidget();
}

class _IletisimWidget extends ConsumerState<IletisimWidget> {
  final _formKey = GlobalKey<FormState>();
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(37.89097165484678, 41.129952540533175),
        infoWindow: InfoWindow(title: 'TİDİSLAM OFİSİ'))
  ];

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.89097165484678, 41.129952540533175),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Text(
          'İLETİŞİM',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: context.isTablet ? Get.height / 2 : Get.height / 4,
          width: double.infinity,
          child: GoogleMap(
            myLocationButtonEnabled: false,
            markers: Set<Marker>.of(_markers),
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),

        const SizedBox(
          height: 20.0,
        ),

        const AdresWidget(
          iconData: FontAwesomeIcons.locationDot,
          text:
              'Bahçelievler Mah 1602 Sokak NO 9\nGüner iş Merkezi Kat 8 Daire 16 Merkez/Batman',
        ),
        const SizedBox(
          height: 20.0,
        ),
        const AdresWidget(
          iconData: FontAwesomeIcons.at,
          text: 'info@tidislam.com',
        ),

        const SizedBox(
          height: 20.0,
        ),
        const AdresWidget(
          iconData: FontAwesomeIcons.phoneVolume,
          text: '-',
        ),

        ///Form yapısını tutan parent widget.
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Custom yapıda bulunan [SoruCevap]
                CustomForm(
                  controller: ref.read(iletisimFormRiverpod).fullname,
                  inputType: TextInputType.name,
                  topLabel: 'İSİM*',
                  formFieldLabel: 'Adınız Soyadınız',
                  maxAlan: 1,
                ),
                CustomForm(
                  controller: ref.read(iletisimFormRiverpod).email,
                  inputType: TextInputType.emailAddress,
                  topLabel: 'E-POSTA*',
                  formFieldLabel: 'E-Posta giriniz',
                  maxAlan: 1,
                ),

                CustomForm(
                  controller: ref.read(iletisimFormRiverpod).telefon,
                  mask: '###########',
                  filter: {"#": RegExp(r'[0-9]')},
                  inputType: TextInputType.phone,
                  topLabel: 'TELEFON*',
                  formFieldLabel: 'Telefon Giriniz',
                  maxAlan: 1,
                ),
                CustomForm(
                  controller: ref.read(iletisimFormRiverpod).subject,
                  inputType: TextInputType.text,
                  topLabel: 'KONU*',
                  formFieldLabel: 'Konu Başlığı Giriniz',
                  maxAlan: 1,
                ),
                CustomForm(
                  controller: ref.read(iletisimFormRiverpod).message,
                  inputType: TextInputType.text,
                  topLabel: 'MESAJ*',
                  formFieldLabel: 'Mesajınızı Giriniz',
                  maxAlan: 6,
                ),

                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ref.read(iletisimFormRiverpod).fetchIletisimForm();
                      }
                    },
                    child: const Text('FORMU GÖNDERİN'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.teal)),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
