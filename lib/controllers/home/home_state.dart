part of 'home_cubit.dart';

enum HomeStatus { initial, success, error }

class HomeState {
  const HomeState(
      {this.status = HomeStatus.initial, this.message = '', this.data});

  final HomeStatus status;
  final String? message;
  final List<HomeSuccessSchema>? data;

  HomeState copyWith(
      {HomeStatus Function()? status,
      String Function()? message,
      List<HomeSuccessSchema>? Function()? data}) {
    return HomeState(
      status: status != null ? status() : this.status,
      message: message != null ? message() : this.message,
      data: data != null ? data() : this.data,
    );
  }
}
