import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'apps/helper/router_schema.dart';

///
/// all navigation and route wrappers are done in this class.
/// we need [context] for navigation because we are still using
/// navigator version 1
///
class Routes {
  final BuildContext context;
  Routes(this.context);

  ///
  /// introductory navigation in app starting.
  ///
  Widget initialNavigate({dynamic argument}) {
    return _findRoute(route: initialRoute).route(argument);
  }

  ///
  /// navigate to another screen, using [SelectRoute],
  /// and [argument] is a data you will send it to another screen.
  ///
  navigate({
    required SelectRoute route,
    dynamic argument,
  }) {
    RouterSchema routerSchema = _findRoute(route: route);

    ///
    /// if you added a new [bloc] wrapper or other statemanager libraries
    /// wrapper in [RouterSchema], you need to check it and wrapped it
    /// with related [Widget] or another methods using [RouteWrapper]
    /// and set it on [router].
    ///
    Widget router = routerSchema.blocProviderValue == null
        ? routerSchema.route(argument)
        : routerSchema
            .route(argument)
            .blocProviderValue(routerSchema.blocProviderValue!);

    Navigator.push(context, router.pageRouteBuilder());
  }

  // return the first route found in the [routers] list.
  RouterSchema _findRoute({required SelectRoute route}) {
    String routeName = route.name;
    RouterSchema routerSchema = routers.firstWhere(
        (RouterSchema routerSchema) =>
            routerSchema.routeName.name == routeName);

    return routerSchema;
  }
}

///
/// contains all routes wrappers, including PageRoutes, Bloc, ...
///
extension RouteWrapper on Widget {
  ///
  /// return a [PageRouteBuilder] to navigate to new screen and default [FadeTransition] animation
  ///
  PageRouteBuilder pageRouteBuilder() => PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> _animation,
              Animation<double> secondaryAnimation) =>
          this,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 300));

  ///
  /// return a [BlocProvider] with a value of a [bloc] class.
  ///
  BlocProvider<StateStreamableSource<Object?>> blocProviderValue(
          StateStreamableSource<Object?> bloc) =>
      BlocProvider.value(
        value: bloc,
        child: this,
      );
}
