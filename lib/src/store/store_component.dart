import 'dart:html';

import 'package:angular/angular.dart';
import '../services/store_service.dart';
import 'package:angular_router/angular_router.dart';
import '../../constants.dart' as constants;


@Component(
  selector: 'store',
  styleUrls: ['store.css'],
  templateUrl: 'store.html',
)
class StoreComponent implements OnInit{
  String imageToDisplay = '';
  final StoreService _storeService;
  final Router _router;
  StoreComponent(this._storeService, this._router);

  ngOnInit() {
    this.getMediaPlayPlanId();
  }

  getMediaPlayPlanIdFromLocalStorage() {
    return window.localStorage[constants.PLAY_PLAN_LOCAL_STORAGE_KEY];
  }

  getMediaPlayPlanId() async {
    String media_play_plan_id = getMediaPlayPlanIdFromLocalStorage();
    if(media_play_plan_id == null) {
      // ONLY FOR DEMO: Media play plan id not found on device.
      // Redirect to setup.
      this._router.navigate('/setup');
    } else {
      try {
        // Get store config from Firebase DB.
        var result = await this._storeService.getDataFromFireStore(
            media_play_plan_id);
        result.then(onFirebaseQuerySuccess);
      } catch (e) {
        onFirebaseQueryError(e);
      }
    }
  }

  /**
   * Checks whether a media play plan id is found. If found show the image on
   * store view, else display default image.
   */
  onFirebaseQuerySuccess (querySnapshot) {
    querySnapshot.forEach((doc) => {
      print(doc.data()),
      if(doc.data().default_media_url != null) {
        imageToDisplay = doc.data().default_media_url
      } else {
        imageToDisplay = constants.DEFAULT_URL
      }
    });
  }

  /** Shows default image on store view. */
  onFirebaseQueryError(error) {
    imageToDisplay = constants.DEFAULT_URL;
  }
}

