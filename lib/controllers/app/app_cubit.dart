//
//  app_cubit.dart
//  Created on 2022 16 August.
//  Copyright © Mishka Group Flutter application,
//  Developed by 2021 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
}
