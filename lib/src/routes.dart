import 'package:angular_router/angular_router.dart';

import 'display_ads/display_ads_component.template.dart' as display_ads_template;
import 'admin/admin_component.template.dart' as admin_template;
import 'setup/setup_component.template.dart' as setup_template;

import 'route_paths.dart';

class Routes {
  static final displayAds = RouteDefinition(
    routePath: RoutePaths.displayAds,
    component: display_ads_template.DisplayAdsComponentNgFactory,
    useAsDefault: true,
  );

  static final admin = RouteDefinition(
    routePath: RoutePaths.admin,
    component: admin_template.AdminComponentNgFactory,
  );

  static final setup = RouteDefinition(
    routePath: RoutePaths.setup,
    component: setup_template.SetupComponentNgFactory,
  );

  static final setupWithId = RouteDefinition(
    routePath: RoutePaths.setupWithId,
    component: setup_template.SetupComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    displayAds,
    admin,
    setup,
    setupWithId,
  ];
}