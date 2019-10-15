import 'package:angular_router/angular_router.dart';

import 'crisis_list_component.template.dart' as crisis_list_template;
import 'hero_list_component.template.dart' as hero_list_template;
import 'route_paths.dart';

class Routes {
  static final device = RouteDefinition(
    routePath: RoutePaths.device,
    component: crisis_list_template.CrisisListComponentNgFactory,
  );

  static final admin = RouteDefinition(
    routePath: RoutePaths.admin,
    component: hero_list_template.HeroListComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    device,
    admin,
  ];
}