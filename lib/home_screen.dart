import 'package:crypto_buddy/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  BannerAd bad = BannerAd(size: AdSize.banner, adUnitId: 'ca-app-pub-7580695620404979/6555057689', listener: const BannerAdListener(), request: AdRequest());

  @override
  Widget build(BuildContext context) {
    AdmobHelper admobHelper = Provider.of<AdmobHelper>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Crypto  Buddy'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 245, 244, 159),
                  Color.fromARGB(255, 255, 185, 180),
                  Color.fromARGB(255, 255, 222, 210),
                  Color.fromARGB(255, 248, 209, 255),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      admobHelper.loadRewardedAd();
                    },
                    child: Text('Load Ad')),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      admobHelper.showRewardAd();
                    },
                    child: Text('Show Ad')),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        key: UniqueKey(),
        child: AdWidget(ad: bad..load()),
      ),
    );
  }
}
