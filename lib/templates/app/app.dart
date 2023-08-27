import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/controllers/app/app_cubit.dart';
import 'package:phone_book/routes.dart';

class App extends StatelessWidget {
  final AppRepository appRepository;

  const App({required this.appRepository, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: appRepository),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider<AppCubit>(create: (BuildContext abContext) => AppCubit())
        ], child: const AppView()));
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // change system statusBar & navBar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFE9E9E9),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFE9E9E9),
        systemNavigationBarIconBrightness: Brightness.dark));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Routes(context).initialNavigate(),
    );
  }
}
