import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/home_success_schema.dart';
import 'package:phone_book/apps/helper/status_error_handler_schema.dart';
import 'package:fpdart/fpdart.dart';

class Home {
  Future<Either<StatusErrorHandlerSchema, List<HomeSuccessSchema>>>
      getUsersData(AppRepository appRepository) async {
    final List<HomeSuccessSchema> contacts = [];

    try {
      Response response = await appRepository.dio.get('/contacts',
          options: Options(headers: {
            'accept': 'application/json',
            'x-apikey': appRepository.apiKey
          }));

      for (var contact in response.data!) {
        HomeSuccessSchema res = HomeSuccessSchema.fromJson(contact);

        if (res.phone != null && res.phone != '') contacts.add(res);
      }

      return Either.right(contacts);
    } on DioException catch (ex) {
      return Either.left(appRepository.statusErrorHandler(ex.response));
    }
  }

  Future<Either<StatusErrorHandlerSchema, HomeSuccessSchema>> getUserData(
      AppRepository appRepository, String id) async {
    try {
      var response = await appRepository.dio.get('/contacts/$id',
          options: Options(headers: {
            'accept': 'application/json',
            'x-apikey': '62e3e6d11894fe7edea71921'
          }));

      return Either.right(
          HomeSuccessSchema.fromJson(jsonDecode(response.data.toString())));
    } on DioException catch (ex) {
      return Either.left(appRepository.statusErrorHandler(ex.response));
    }
  }

  addUser(AppRepository appRepository) {}
}
