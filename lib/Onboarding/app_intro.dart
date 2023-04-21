import 'package:crypto_buddy/Onboarding/login_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
// ignore: depend_on_referenced_packages

class AppIntro extends StatelessWidget {
  const AppIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Easy to use',
              // footer: Text("data"),

              body: 'Crypto Buddy is the easiest place to  get signals for cryptocurrency',
              image: Card(
                elevation: 5,
                color: Colors.black12,
                child: Center(child: Image.asset('assets/images/study.png', height: 200)),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Market View',
              body: 'Track Crypto with CoinMarketCap',
              image: Card(
                elevation: 5,
                color: Colors.black26,
                child: Center(child: Image.asset('assets/images/coinmarketcan.png', height: 600)),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Earn Real Crypto',
              body: 'You can also earn real crypto by just using Crypo Buddy',
              image: Card(
                color: Colors.black26,
                elevation: 5,
                child: Center(child: Image.asset('assets/images/earncrypto.gif', height: 200)),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text('Get Started'),
          onDone: () => goToLoagin(context),
          next: const Icon(Icons.arrow_forward),
          showBackButton: true,
          back: const Icon(Icons.arrow_back),
          dotsDecorator: getDotDecor(),
          globalBackgroundColor: Colors.white,
          animationDuration: 750,
        ),
      );

  PageDecoration getPageDecoration() {
    return const PageDecoration(titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), bodyTextStyle: TextStyle(fontSize: 20), bodyPadding: EdgeInsets.all(8), imagePadding: EdgeInsets.all(24), pageColor: Colors.teal);
  }

  void goToLoagin(context) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));

  DotsDecorator getDotDecor() {
    return DotsDecorator(color: Colors.grey, activeColor: Colors.teal, size: const Size(10, 10), activeSize: const Size(22, 10), activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  }
}
