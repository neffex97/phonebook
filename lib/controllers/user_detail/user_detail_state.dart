part of 'user_detail_cubit.dart';

enum UserDetailStatus { initial, success, error }

class UserDetailState {
  const UserDetailState(
      {this.status = UserDetailStatus.initial, this.message = '', this.data});

  final UserDetailStatus status;
  final String? message;
  final HomeSuccessSchema? data;

  UserDetailState copyWith(
      {UserDetailStatus Function()? status,
      String Function()? message,
      HomeSuccessSchema? Function()? data}) {
    return UserDetailState(
      status: status != null ? status() : this.status,
      message: message != null ? message() : this.message,
      data: data != null ? data() : this.data,
    );
  }
}
