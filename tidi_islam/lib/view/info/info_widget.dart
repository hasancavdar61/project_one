import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = context.isTablet ? Get.height * 0.2 : Get.height * 0.15;
    double width = context.isTablet ? Get.width * 0.2 : Get.width * 0.35;
    return Center(
      child: SingleChildScrollView(
        child: context.isTablet
            ? brandsTablet(height, width, context)
            : brandsPhone(height, width, context),
      ),
    );
  }

  Column brandsTablet(double height, double width, BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: AutoSizeText(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 5,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                height: height,
                width: width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(images[0]),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                height: height,
                width: width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(images[1]),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                height: height,
                width: width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(images[2]),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                height: height,
                width: width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(images[3]),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                height: height,
                width: width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(images[4]),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationLegalese: 'Daynex',
              applicationName: 'TİDİSLAM',
              applicationVersion: 'appV3',
              applicationIcon: Center(
                child: Image.asset(
                  'assets/tidislam-logo-splash.png',
                  width: Get.width / 2.3,
                ),
              ),
            );
          },
          child: const Text(
            'Uygulama Lisansları',
            style: TextStyle(color: Colors.teal),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column brandsPhone(double height, double width, BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: AutoSizeText(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(images[0]),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(images[1]),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(images[2]),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height,
              width: width,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.white),
              child: Image.network(images[3]),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: height,
              width: width,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.white),
              child: Image.network(images[4]),
            )
          ],
        ),
        TextButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationLegalese: 'Daynex',
              applicationName: 'TİDİSLAM',
              applicationVersion: 'appV3',
              applicationIcon: Center(
                child: Image.asset(
                  'assets/tidislam-logo-splash.png',
                  width: Get.width / 2.3,
                ),
              ),
            );
          },
          child: const Text(
            'Uygulama Lisansları',
            style: TextStyle(color: Colors.teal),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

List images = [
  'https://www.tidislam.com/upload/ckfinder/images/logo/batman-valiligi.PNG',
  'https://www.tidislam.com/upload/ckfinder/images/logo/batman-belediyesi.png',
  'https://www.tidislam.com/upload/ckfinder/images/logo/batman-il-ozel-idaresi.png',
  'https://www.tidislam.com/upload/ckfinder/images/logo/batman-isitme-engelliler-dernegi.png',
  'https://www.tidislam.com/upload/ckfinder/images/logo/batman-il-muftulugu.png'
];
String text = ''' 
Benim dilim 
Benim dinim…
İşitme engelli bireylere özel tasarlanan tidislam.com web sitesi, yüce dinimiz İslam’ı Türk işaret diliyle anlatıyor.
İçeriklerin; Dini Kelimeler ve Anlamları, İslam’a Dair Temel Bilgiler, Peygamber Efendimiz Hz. Muhammed’in (S.A.S.) Hayatı ve Türk İşaret Dilinde Kur’an-ı Kerim Meali olmak üzere 4 ana kategori altında toplandığı siteye kayıt olmak ve hizmetlerden üye girişi yaparak faydalanmak da mümkün.
Kullanıcılara site içinde yer alan her türlü bilgiye kolayca ulaşabilmeleri için işaret dili kullanan üç boyutlu bir asistanın eşlik ettiği tidislam.com, “sadece işitme engelli bireylere yönelik tasarımı ve işleyişiyle dünyada bir ilk” olma özelliğine sahip.
Batman Valiliği ve Batman Belediyesi'nin desteğiyle İşitme Engelliler Eğitim Kültür Gençlik ve Spor Kulübü Derneği ile birlikte yürütülen çalışmalar sonucunda hayata geçirilen projenin paydaşları arasında Batman İl Özel İdare ve Batman Müftülüğü de bulunuyor.
Sitede kullanılan tüm içerikler, Diyanet İşleri Başkanlığı kaynakları esas alınarak hazırlanıyor. 
Tüm içeriklerin kadın, erkek ve çocuklar için ayrı ayrı bölümlerde Türk işaret diliyle anlatıldığı web sitesine cep telefonları üzerinden ulaşmak isteyenler ise, Google Play Store ve App Store’dan TİDİSLAM uygulamasını ücretsiz indirebilecek. 
''';
