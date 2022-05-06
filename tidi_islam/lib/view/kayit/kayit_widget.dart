import 'package:flutter/material.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class KayitWidget extends StatefulWidget {
  KayitWidget({Key? key}) : super(key: key);

  @override
  State<KayitWidget> createState() => _KayitWidgetState();
  final _formKey = GlobalKey<FormState>();
}

class _KayitWidgetState extends State<KayitWidget> {
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
                      const CustomForm(
                        inputType: TextInputType.name,
                        topLabel: 'İSİM*',
                        formFieldLabel: 'İsminizi Giriniz',
                        maxAlan: 1,
                      ),
                      const CustomForm(
                        inputType: TextInputType.name,
                        topLabel: 'SOYİSİM*',
                        formFieldLabel: 'Soyisminizi Giriniz',
                        maxAlan: 1,
                      ),
                      const CustomForm(
                        inputType: TextInputType.name,
                        topLabel: 'İL*',
                        formFieldLabel: 'İl Giriniz',
                        maxAlan: 1,
                      ),
                      const CustomForm(
                        inputType: TextInputType.name,
                        topLabel: 'İLÇE*',
                        formFieldLabel: 'İlçe Giriniz',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        mask: '# (###) ###-##-##',
                        filter: {"#": RegExp(r'[0-9]')},
                        inputType: TextInputType.phone,
                        topLabel: 'TELEFON*',
                        formFieldLabel: '0 (---) --- -- --',
                        maxAlan: 1,
                      ),
                      const CustomForm(
                        inputType: TextInputType.emailAddress,
                        topLabel: 'E-POSTA*',
                        formFieldLabel: 'eposta@epostagiriniz.com',
                        maxAlan: 1,
                      ),

                      const CustomForm(
                        isObsecure: true,
                        inputType: TextInputType.visiblePassword,
                        topLabel: 'ŞİFRE*',
                        formFieldLabel: 'Şifre Giriniz',
                        maxAlan: 1,
                      ),
                      const CustomForm(
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
                    widget._formKey.currentState!.validate();
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
