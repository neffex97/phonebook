//
//  weather_state.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github,
//  Developed by 2023 Hossein HassanNejad.
//

part of 'add_user_cubit.dart';

enum AddUserStatus { initial, success, error }

class AddUserState {
  const AddUserState({this.status = AddUserStatus.initial, this.message = ''});

  final AddUserStatus status;
  final String message;

  AddUserState copyWith(
      {AddUserStatus Function()? status, String Function()? message}) {
    return AddUserState(
        status: status != null ? status() : this.status,
        message: message != null ? message() : this.message);
  }
}
