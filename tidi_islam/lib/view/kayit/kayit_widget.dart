import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/model/city_model.dart';
import 'package:tidi_islam/model/district_model.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/view/profil/widgets/shower_container.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class KayitWidget extends ConsumerStatefulWidget {
  KayitWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<KayitWidget> createState() => _KayitWidgetState();
  final _formKey = GlobalKey<FormState>();
}

class _KayitWidgetState extends ConsumerState<KayitWidget> {
  List<Iller>? city = [];
  List<Ilceler> ilceler = [];
  String? district;
  Map<String, String> map = {};

  var ilceName;

  var ilName;

  @override
  void initState() {
    Service().cityCall().then((value) {
      setState(() {
        city = value!.iller;
      });
    });
    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [];
    return menuItems;
  }

  String defValue = 'Şehir seçiniz';
  @override
  Widget build(BuildContext context) {
    ///Form yapısı ana widgeti [SingleChildScrollView]

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Text(
                'KAYIT FORMU',
                style: Theme.of(context).textTheme.headline4,
              ),

              ///Form yapısını tutan parent widget.
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: widget._formKey,
                  child: Column(
                    children: [
                      /// Custom yapıda bulunan [SoruCevap]
                      CustomForm(
                        controller: ref.read(registerRiverpod).name,
                        inputType: TextInputType.name,
                        topLabel: 'İSİM*',
                        formFieldLabel: 'İsminizi Giriniz',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        controller: ref.read(registerRiverpod).surname,
                        inputType: TextInputType.name,
                        topLabel: 'SOYİSİM*',
                        formFieldLabel: 'Soyisminizi Giriniz',
                        maxAlan: 1,
                      ),

                      InkWell(
                        onTap: () async {
                          await Get.bottomSheet(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                itemCount: city!.length,
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (() async {
                                        await Service()
                                            .districtCall(
                                                cityId: city![index].id!)
                                            .then((value) {
                                          setState(() {
                                            ilceler = value!.ilceler!;
                                          });
                                        });

                                        setState(() {
                                          ref.read(registerRiverpod).city =
                                              city![index].id!;
                                          ilName = city![index].name;
                                        });
                                        debugPrint('Seçilen il id: ' +
                                            ref
                                                .read(registerRiverpod)
                                                .city
                                                .toString());

                                        Get.back();
                                      }),
                                      child: ListTile(
                                        tileColor: Colors.white,
                                        title: Text(
                                          city![index].name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.black),
                                        ),
                                        subtitle: Text(
                                            'Plaka Kodu: ' + city![index].id!,
                                            style: const TextStyle(
                                                color: Colors.black)),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          );
                        },
                        child: ShowerContainer(
                          topLabel: 'İL*',
                          formFieldLabel: ilName ?? 'İl Seçiniz',
                          icColor: Colors.white,
                        ),
                      ),

                      InkWell(
                        onTap: () async {
                          await Get.bottomSheet(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                itemCount: ilceler.length,
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (() async {
                                        setState(() {
                                          ref.read(registerRiverpod).district =
                                              ilceler[index].id;

                                          ilceName = ilceler[index].name;

                                          debugPrint('Seçilen ilce id: ' +
                                              ref
                                                  .read(registerRiverpod)
                                                  .district
                                                  .toString());
                                        });

                                        Get.back();
                                      }),
                                      child: ListTile(
                                        tileColor: Colors.white,
                                        title: Text(
                                          ilceler[index].name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.black),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          );
                        },
                        child: ShowerContainer(
                          topLabel: 'İLÇE*',
                          formFieldLabel: ilceName ?? 'İlçe Seçiniz',
                          icColor: Colors.white,
                        ),
                      ),

                      CustomForm(
                        controller: ref.read(registerRiverpod).tel,
                        mask: '###########',
                        filter: {"#": RegExp(r'[0-9]')},
                        inputType: TextInputType.phone,
                        topLabel: 'TELEFON*',
                        formFieldLabel: '0 (---) --- -- --',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        controller: ref.read(registerRiverpod).email,
                        inputType: TextInputType.emailAddress,
                        topLabel: 'E-POSTA*',
                        formFieldLabel: 'eposta@epostagiriniz.com',
                        maxAlan: 1,
                      ),

                      CustomForm(
                        controller: ref.read(registerRiverpod).password,
                        isObsecure: true,
                        inputType: TextInputType.visiblePassword,
                        topLabel: 'ŞİFRE*',
                        formFieldLabel: 'Şifre Giriniz',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        controller: ref.read(registerRiverpod).paswordconf,
                        isObsecure: true,
                        inputType: TextInputType.visiblePassword,
                        topLabel: 'ŞİFRE TEKRAR*',
                        formFieldLabel: 'Şifreyi Tekrar Giriniz',
                        maxAlan: 1,
                      ),
                    ],
                  ),
                ),
              ),

              /// Submit butonu [ElevatedButton]
              Container(
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget._formKey.currentState!.validate()) {
                      ref.read(registerRiverpod).fetchRegister();
                    } else {
                      Get.snackbar(
                        'Hata Oluştu',
                        'Lütfen formu doğru şekilde doldurunuz',
                        backgroundColor: Colors.teal,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: const Text('ÜYELİK FORMUNU GÖNDER'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
