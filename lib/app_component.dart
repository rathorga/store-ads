// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular_app/src/route_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'src/services/store_service.dart';
import 'package:googleapis_auth/auth_browser.dart' as auth;

import 'src/routes.dart';

import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

@Component(
  selector: 'my-app',
    directives: [
      routerDirectives,
    ],
    templateUrl: 'app_component.html',
    exports: [RoutePaths, Routes],
  providers: [ClassProvider(StoreService)],
)
class AppComponent {
//  @override
//  ngOnInit() {
//    initializeApp(
//        apiKey: "API KEY FROM SANLOT ISSUE",
//        authDomain: "store-ads-staging.firebaseapp.com",
//        databaseURL: "https://store-ads-staging.firebaseio.com",
//        storageBucket: "staging.store-ads-staging.appspot.com",
//        projectId: 'store-ads-staging');
//
//    fs.Firestore store = firestore();
//    var docRef = store.collection('publishers').doc('woolworths')
//                      .collection('stores').doc('woolworths_metro_york_street')
//                      .collection('devices').doc('device_111_self_checkout').collection('media_play_plans').where('media_play_plan_id', '==', '9sd1g0ojAXfwXSfT71Nq');
//
//    docRef.get().then((querySnapshot) => {
//    querySnapshot.forEach((doc) => {
//      print(doc.data())
//    })
//    });
//  }
}
