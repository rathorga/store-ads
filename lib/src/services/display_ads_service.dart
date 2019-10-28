import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

class DisplayAdsService {
  fs.Firestore store = null;

  DisplayAdsService() {
    initializeApp(
        apiKey: "ADD API KET HERE",
        authDomain: "store-ads-staging.firebaseapp.com",
        databaseURL: "https://store-ads-staging.firebaseio.com",
        storageBucket: "staging.store-ads-staging.appspot.com",
        projectId: 'store-ads-staging');

    store = firestore();
  }

  getDataFromFireStore(String play_plan_id) {
    var docRef = store.collection('publishers').doc('woolworths')
        .collection('stores').doc('woolworths_metro_york_street')
        .collection('devices').doc('device_111_self_checkout')
        .collection('media_play_plans')
        .where('media_play_plan_id', '==', play_plan_id);
    return docRef.get();
  }
}