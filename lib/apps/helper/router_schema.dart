import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:phone_book/templates/add_user/add_user.dart';
import 'package:phone_book/templates/home/home.dart';
import 'package:phone_book/templates/user_detail/user_detail.dart';

///
/// Is a model to implement all Mishka CMS app routes.
///
/// > if u want to add new [bloc] or other statemanager libraries wrapper:
/// > 1. add a new optional param to [RouterSchema] just like `blocProviderValue`
/// > 2. read full documentation of [Routes]
///
class RouterSchema {
  ///
  /// uniq id for each route.
  ///
  UniqueKey id = UniqueKey();

  ///
  /// must be a specific [SelectRoute] name for the current route.
  ///
  SelectRoute routeName;

  ///
  /// in this callback, you get an [argument] that if you want to send
  /// data from one router to another, you must pass this [argument] to your router
  /// class. and finally you have to return a router.
  ///
  Function(dynamic argument) route;

  ///
  /// if your route is going to use bloc, we will put that
  /// bloc in this section for the current route and your route will look like
  /// this in the background
  /// ```dart
  /// BlocProvider.value(
  ///   value: blocProviderValue,
  ///   child: route,
  /// );
  /// ```
  ///
  StateStreamableSource<Object?>? blocProviderValue;

  RouterSchema(
      {required this.routeName, required this.route, this.blocProviderValue});
}

///
/// introductory route for starting the app.
///
SelectRoute initialRoute = SelectRoute.home;

///
/// List of all possible routes in app
///
/// add new route to list
/// ```dart
/// RouterSchema(
/// routeName: your sapcific route name,
/// route: (argument) => return your route and if your route receive data, pass
/// argument to your route,
/// blocProviderValue: if your route need wrapped with BlocProvider.Value, so
/// implement your Bloc class here)
/// ```
///
List<RouterSchema> routers = [
  RouterSchema(routeName: SelectRoute.home, route: (argument) => const Home()),
  RouterSchema(
      routeName: SelectRoute.addUser, route: (argument) => const AddUser()),
  RouterSchema(
      routeName: SelectRoute.userDetail,
      route: (argument) => UserDetail(
            id: argument,
          ))
];

///
/// contains of all the routes names.
///
enum SelectRoute { home, addUser, userDetail }
