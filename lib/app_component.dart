import 'package:angular/angular.dart';
import 'package:angular_app/src/route_paths.dart';
import 'package:angular_router/angular_router.dart';

import 'src/services/display_ads_service.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
    directives: [
      routerDirectives,
    ],
    templateUrl: 'app_component.html',
    exports: [RoutePaths, Routes],
  providers: [ClassProvider(DisplayAdsService)],
)
class AppComponent {}
