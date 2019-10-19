import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

const String PLAY_PLAN_LOCAL_STORAGE_KEY = 'media_play_plan_id';

@Component(
  selector: 'setup',
  directives: [
    routerDirectives,
  ],
  template: '''
    <h2>Setup</h2>
    <p>ENTER_THE_STORE_ID_IN_URL_BAR</p>
  ''',
)
class SetupComponent implements OnInit{
  ngOnInit() {
    window.localStorage[PLAY_PLAN_LOCAL_STORAGE_KEY] = '9sd1g0ojAXfwXSfT71Nq';
  }
}