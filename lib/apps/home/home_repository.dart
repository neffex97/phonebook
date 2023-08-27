import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/home_success_schema.dart';
import 'package:phone_book/apps/home/home.dart';
import 'package:phone_book/apps/helper/status_error_handler_schema.dart';
import 'package:fpdart/fpdart.dart';

abstract class IHomeRepository {
  Future<Either<StatusErrorHandlerSchema, List<HomeSuccessSchema>>>
      getUsersData(AppRepository appRepository);
  Future<Either<StatusErrorHandlerSchema, HomeSuccessSchema>> getUserData(
      AppRepository appRepository, String id);
}

class HomeRepository implements IHomeRepository {
  HomeRepository({required Home home}) : _home = home;

  final Home _home;

  @override
  Future<Either<StatusErrorHandlerSchema, List<HomeSuccessSchema>>>
      getUsersData(
    AppRepository appRepository,
  ) async =>
          _home.getUsersData(appRepository);

  @override
  Future<Either<StatusErrorHandlerSchema, HomeSuccessSchema>> getUserData(
          AppRepository appRepository, String id) async =>
      _home.getUserData(appRepository, id);
}
