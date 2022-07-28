import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_view.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'UYGULAMAMIZA HOŞGELDİNİZ',
          body:
              'Uygulamamızın amacı yüce dinimiz İslam ilgili bilgileri işaret diliyle anlatmaktır.',
          image: buildImage('assets/tidislam-logo-splash.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'EXTRA FAST DELIVERY',
          body: 'Your food will be delivered quickly to you fresh and hot',
          image: buildImage('assets/tidislam-logo-splash.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'FIND YOUR FAVORITE FOOD',
          body:
              'Search for the best restaurant in your area and choose your favorite food ',
          image: buildImage('assets/tidislam-logo-splash.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'ENJOY YOUR MEAL',
          body: 'Enjoy your favorite food within minutes',
          image: buildImage('assets/tidislam-logo-splash.png'),
          decoration: buildDecoration(),
        ),
      ],

      next: const Icon(
        Icons.navigate_next,
        size: 40,
        color: Colors.white,
      ),

      done: const Text('Bitir',
          style: TextStyle(color: Colors.white, fontSize: 20)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: const Text(
        'Geç',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ), //by default, skip goes to the last page
      onSkip: () => goToHome(context),
      dotsDecorator: getDotDecoration(),
      animationDuration: 500,
      globalBackgroundColor: Colors.black,
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Colors.white,
      size: const Size(10, 10),
      activeColor: Colors.teal,
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  void goToHome(BuildContext context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => const AnasayfaView()));

  Widget buildImage(String path) => Padding(
        padding: const EdgeInsets.all(60.0),
        child: Center(child: Image.asset(path)),
      );

  PageDecoration buildDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.teal),
        bodyTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        pageColor: Colors.black,
        imagePadding: EdgeInsets.all(0),
      );
}
