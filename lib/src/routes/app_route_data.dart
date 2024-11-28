import 'package:budget/src/features/auth/screens/onboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../features/home/screens/home_screen.dart';

part 'app_route_data.g.dart';
@TypedGoRoute<OnBoardRoute>(
  path: '/',
)
class OnBoardRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardScreen();
  }
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

