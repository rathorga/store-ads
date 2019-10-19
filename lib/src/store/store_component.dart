import 'dart:html';

import 'package:angular/angular.dart';
import '../services/store_service.dart';
import 'package:angular_router/angular_router.dart';

const String PLAY_PLAN_LOCAL_STORAGE_KEY = 'media_play_plan_id';
const String DEFAULT_URL = 'https://storage.cloud.google.com/' +
    'store_ads_staging_advertiser_creative_assets/woolworths/2019/10/11/' +
    'woolworths_default.jpg?folder=gtech-cse-demos';


@Component(
  selector: 'crises',
  styleUrls: ['store.css'],
  template: '''
    <div class="ads-mode-on" [style.background-image]="'url(' + imageToDisplay + ')'" >
    </div>
  ''',
)
class StoreComponent implements OnInit{
  String imageToDisplay = '';
  final StoreService _storeService;
  final Router _router;
  StoreComponent(this._storeService, this._router);
  ngOnInit() {
    this.checkLocalStorageForMediaPlan();
  }

  checkLocalStorageForMediaPlan() {
    String media_play_plan_id = window.localStorage[PLAY_PLAN_LOCAL_STORAGE_KEY];
    if(media_play_plan_id == null) {
      this._router.navigate('/setup/ENTER_THE_STORE_ID_HERE');
    } else {
      // Get store config from DB.
      this._storeService.getDataFromFireStore(media_play_plan_id).then((querySnapshot) => {
          querySnapshot.forEach((doc) => {
            print(doc.data())
//          if(doc.data().default_media_url != null) {
//          // Got config now set image to display.
//
////          imageToDisplay = doc.data().default_media_url
//          } else {
//              // Display default page.
//              imageToDisplay = DEFAULT_URL
//          }
        })
      });
    }
  }
}

