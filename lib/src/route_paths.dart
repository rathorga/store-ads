import 'package:angular_router/angular_router.dart';

class RoutePaths {
  static final store = RoutePath(path: '/store');
  static final admin = RoutePath(path: '/admin');
  static final setup = RoutePath(path: 'setup/:play_plan_id');
}