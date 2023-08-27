//
//  app_sate.dart
//  Created on 2022 16 August.
//  Copyright © Mishka Group Flutter application,
//  Developed by 2021 Hossein HassanNejad.
//

part of 'app_cubit.dart';

abstract class AppState {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}
