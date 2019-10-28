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
  var activePlans = [];
  var activeMedia = [];
  var cnt = 0;
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
      this.onFirebaseQuerySuccess();
//      try {
//        // Get store config from Firebase DB.
//        var result = await this._storeService.getDataFromFireStore(
//            media_play_plan_id);
//        result.then(onFirebaseQuerySuccess);
//      } catch (e) {
//        onFirebaseQueryError(e);
//      }
    }
  }

  /**
   * Checks whether a media play plan id is found. If found show the image on
   * store view, else display default image.
   */
  onFirebaseQuerySuccess () {
    var data = {
      'plans': [
        {
          'plan_name': 'plan_1',
          'plan_status': 'ACTIVE',
          'media': [
            {
              'image_to_display': 'soplan_statusme_url',
              'display_duration': '12',
              'start_time': '2019-10-25 20:27:00',
              'end_time': '2019-10-26 20:28:05',
            }
          ]
        }
      ]
    };
    this.getActivePlans(data['plans']);
    this.displayMedia();
//    querySnapshot.forEach((doc) => {
//      print(doc.data()),
//      if(doc.data().default_media_url != null) {
//        imageToDisplay = doc.data().default_media_url
//      } else {
//        imageToDisplay = constants.DEFAULT_URL
//      }
//    });
  }

  getActivePlans(plans) {
    plans.forEach((plan) => {
      if (plan['plan_status'] == 'ACTIVE') {
        activePlans.add(plan)
      }
    });
    getMediaToDisplay(activePlans);
  }

  getMediaToDisplay(activePlans) {
    var firstMediaToDisplay;
    for (var i = 0; i < activePlans.length; i++) {
      var media = activePlans[i]['media'];
      for (var j = 0; j < media.length; j++) {
        this.checkMediaValidity(media[j]);
      }
    }
  }

  checkMediaValidity(media) {
    var startDateTime = DateTime.parse(media['start_time']);
    var timeAfterMediaPlayed = startDateTime.add(Duration(seconds: 12));
    var endDateTime = DateTime.parse(media['end_time']);
    if (this.isStartAndEndTimesValid(startDateTime, endDateTime)) {
      if(timeAfterMediaPlayed.isBefore(endDateTime)) {
        activeMedia.add(media);
      }
    }
  }

  isStartAndEndTimesValid(start, end) {
    var now = DateTime.now();
    if (start.isAfter(now)) {
      return false;
    }
    if (end.isBefore(now)) {
      return false;
    }
    return true;
  }

  var cnt = 0;

  run() {
    Timer(const Duration(milliseconds: 10), this.doStuffCallback);

//    window.setTimeout(() => {
//    document.getElementById("bar").style.width = barMovement[cnt][1].width
//    cnt++;
//    if (cnt < barMovement.length) run();
//    }, barMovement[cnt][0])
  }

  doStuffCallback() {

  }

  /** Shows default image on store view. */
  onFirebaseQueryError(error) {
    imageToDisplay = constants.DEFAULT_URL;
  }
}

