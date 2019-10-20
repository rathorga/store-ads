import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

class StoreService {
  fs.Firestore fireStoreClient = null;

  StoreService() {
    init();
    fireStoreClient = getFireStoreClient();
  }

  /** Connects the application to Firebase APIs. */
  init() {
    fb.initializeApp(
        apiKey: "API KEY FROM SANLOT ISSUE",
        authDomain: "store-ads-staging.firebaseapp.com",
        databaseURL: "https://store-ads-staging.firebaseio.com",
        storageBucket: "staging.store-ads-staging.appspot.com",
        projectId: 'store-ads-staging');
  }

  getFireStoreClient() {
    return fb.firestore();
  }

  getDataFromFireStore(String play_plan_id) async {
    var docRef = fireStoreClient.collection('publishers').doc('woolworths')
        .collection('stores').doc('woolworths_metro_york_street')
        .collection('devices').doc('device_111_self_checkout')
        .collection('media_play_plans')
        .where('media_play_plan_id', '==', play_plan_id);
    return docRef.get();
  }
}
