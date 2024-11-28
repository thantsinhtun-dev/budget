import 'package:go_router/go_router.dart';

import 'app_route_data.dart';


final goRouter = GoRouter(
    initialLocation: OnBoardRoute().location, // location getter is generated.
    //$appRoutes is generated
    routes: $appRoutes,
    redirect: (context, state) { // Optional
      // You can manage redirection here by returning the route location.
      // Also you can prevent the user from navigating to the screen via the search URL.
      // Return null to prevent redirect.
    }
    // errorBuilder: (context, e) => ErrorScreen(e), // Optional
// navigatorKey: rootNavigationKey, //Optional
);