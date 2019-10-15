// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:angular/angular.dart';
import 'package:angular_app/src/route_paths.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/app_layout/material_temporary_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:angular_router/angular_router.dart';
import 'package:googleapis_auth/auth_browser.dart' as auth;
import 'src/routes.dart';
import 'package:firebase/firebase.dart';

import 'package:firebase/firestore.dart' as fs;


Future authorizedClient(auth.ClientId id) {
  // Initializes the oauth2 browser flow, completes as soon as authentication
  // calls can be made.
  return auth.createImplicitBrowserFlow(id, ['https://www.googleapis.com/auth/datastore'])
      .then((auth.BrowserOAuth2Flow flow) {
    // Try getting credentials without user consent.
    // This will succeed if the user already gave consent for this application.
    return flow.clientViaUserConsent(immediate: true).catchError((_) {

      return flow.clientViaUserConsent(immediate: false);
    }, test: (error) => error is auth.UserConsentException);
  });
}

@Component(
  selector: 'my-app',
    directives: [
      DeferredContentDirective,
      MaterialButtonComponent,
      MaterialIconComponent,
      MaterialPersistentDrawerDirective,
      MaterialTemporaryDrawerComponent,
      MaterialToggleComponent,
      routerDirectives,
    ],
    templateUrl: 'my_app.html',
    styleUrls: ['package:angular_components/app_layout/layout.scss.css'],
    exports: [RoutePaths, Routes],
)
class AppComponent implements OnInit{
  bool customWidth = false;
  bool end = false;
  bool overlay = false;
  DatabaseReference ref;
  Database db;
  App app;

  @override
  ngOnInit() {
    app = initializeApp(
        apiKey: "API key of appengine project",
        authDomain: "store-ads-staging.firebaseapp.com",
        databaseURL: "https://store-ads-staging.firebaseio.com",
        storageBucket: "staging.store-ads-staging.appspot.com",
        projectId: 'store-ads-staging');

    fs.Firestore store = app.firestore();
    fs.CollectionReference ref = store.collection("publishers");
  }
}
