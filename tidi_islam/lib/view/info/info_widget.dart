import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
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
          ],
        ),
      ),
    );
  }
}

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
