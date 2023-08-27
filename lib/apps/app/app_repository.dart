import 'package:dio/dio.dart';
import 'package:phone_book/apps/add_user/add_user.dart';
import 'package:phone_book/apps/add_user/add_user_repository.dart';
import 'package:phone_book/apps/home/home_repository.dart';
import 'package:phone_book/apps/home/home.dart';
import 'package:phone_book/apps/helper/status_error_handler_schema.dart';

abstract class IAppRepository {
  String get apiKey;
  Dio get dio;
  StatusErrorHandlerSchema statusErrorHandler(Response? response);
}

class AppRepository implements IAppRepository {
  AppRepository();

  final HomeRepository homeRepository = HomeRepository(home: Home());
  final AddUserRepository addUserRepository =
      AddUserRepository(addUser: AddUser());

  @override
  Dio get dio => Dio(BaseOptions(
      baseUrl: 'https://contacts-df29.restdb.io/rest',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)));

  @override
  StatusErrorHandlerSchema statusErrorHandler(Response? response) {
    switch (response?.statusCode) {
      case 500:
        return StatusErrorHandlerSchema(
            message: "Server Error pls retry later");
      case 400:
        return StatusErrorHandlerSchema(message: 'Bad Request!');
      case 401:
        return StatusErrorHandlerSchema(message: 'Unauthorized!');
      case 403:
        return StatusErrorHandlerSchema(
            message: 'Error occurred pls check internet and retry.');
      case 404:
        return StatusErrorHandlerSchema(message: 'Not Found!');
      default:
        return StatusErrorHandlerSchema(message: 'Error occurred!');
    }
  }

  @override
  String get apiKey => "62e3e6d11894fe7edea71921";
}
