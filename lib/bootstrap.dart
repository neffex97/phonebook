import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/observer.dart';
import 'package:phone_book/templates/app/app.dart';

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const Observer();

  final AppRepository appRepository = AppRepository();

  runZonedGuarded(
    () => runApp(App(appRepository: appRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
