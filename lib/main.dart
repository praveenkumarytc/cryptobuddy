import 'package:crypto_buddy/Onboarding/splash_screen.dart';
import 'package:crypto_buddy/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AdmobHelper>(create: (context) => AdmobHelper())
  ], child: const CryptoBuddy()));
}

class CryptoBuddy extends StatelessWidget {
  const CryptoBuddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Buddy APP',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Splash(),
    );
  }
}
