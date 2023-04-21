import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper extends ChangeNotifier {
  //reward point Method
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  num rewardedPoint = 0;
  num getReward() => rewardedPoint;

  //rewarded Ad Method
  late RewardedAd _rewardedAd;

  static initialization() {
    // ignore: unnecessary_null_comparison
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  void loadRewardedAd() {
    // _isLoading = true;
    RewardedAd.load(
        adUnitId: 'ca-app-pub-7580695620404979/8839807223',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            // ignore: avoid_print
            print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _rewardedAd = ad;
            _isLoading = false;
          },
          onAdFailedToLoad: (LoadAdError error) {
            // ignore: avoid_print
            print('RewardedAd failed to load: $error');
            // loadRewardedAd();q
            // _isLoading = false;
            // _isLoading = false;
          },
        ));
  }

  void showRewardAd() {
    _rewardedAd.show(onUserEarnedReward: (ad, RewardItem rPoint) async {
      print("Adds Reward is ${rPoint.amount}");

      //rewarded point update function
    });

    _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) => print('$ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
    );
  }
}
