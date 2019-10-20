import 'package:angular_router/angular_router.dart';

import 'store/store_component.template.dart' as store_template;
import 'admin/admin_component.template.dart' as admin_template;
import 'setup/setup_component.template.dart' as setup_template;

import 'route_paths.dart';

class Routes {
  static final store = RouteDefinition(
    routePath: RoutePaths.store,
    component: store_template.StoreComponentNgFactory,
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
    store,
    admin,
    setup,
    setupWithId,
  ];
}