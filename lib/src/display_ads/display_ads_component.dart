import 'dart:html';

import 'package:angular/angular.dart';
import '../services/display_ads_service.dart';
import 'package:angular_router/angular_router.dart';
import '../../constants.dart' as constants;


@Component(
  selector: 'display-ads',
  styleUrls: ['display_ads.css'],
  templateUrl: 'display_ads.html',
)
class DisplayAdsComponent implements OnInit {
  String imageToDisplay = '';
  final DisplayAdsService _displayAdsService;
  final Router _router;
  DisplayAdsComponent(this._displayAdsService, this._router);

  ngOnInit() {
    this.getMediaPlayPlanId();
  }

  getMediaPlayPlanIdFromLocalStorage() {
    return window.localStorage[constants.PLAY_PLAN_LOCAL_STORAGE_KEY];
  }

  getMediaPlayPlanId() {
    String media_play_plan_id = getMediaPlayPlanIdFromLocalStorage();
    if(media_play_plan_id == null) {
      // ONLY FOR DEMO: Media play plan id not found on device.
      // Redirect to setup.
      this._router.navigate('/setup');
    } else {
      try {
        this._displayAdsService.getDataFromFireStore(media_play_plan_id).then(
            this.onFirebaseQuerySuccess);
      } catch(e) {
        this.onFirebaseQueryError(e);
      }
    }
  }

  /**
   * Checks whether a media play plan id is found. If found show the image on
   * displayAds view, else display default image.
   */
  onFirebaseQuerySuccess (querySnapshot) {
    var supportedMedia;
    querySnapshot.forEach((doc) => {
      if(doc.data() != null) {
        supportedMedia = doc.data()['media'],
        if (supportedMedia.length != 0) {
          imageToDisplay = supportedMedia[0]['media_url']
        } else {
          imageToDisplay = supportedMedia['default_media_url']
        }
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

