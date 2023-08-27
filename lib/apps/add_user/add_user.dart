import 'dart:convert';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/add_user_success_schema.dart';
import 'package:phone_book/apps/helper/status_error_handler_schema.dart';
import 'package:fpdart/fpdart.dart';
import 'package:phone_book/consts.dart';

class AddUser {
  Future<Either<StatusErrorHandlerSchema, AddUserSuccessSchema>> addUser(
      AppRepository appRepository,
      String firstName,
      String lastName,
      String email,
      String notes,
      List<String> picture,
      String phone) async {
    try {
      var response = await appRepository.dio.post('/contacts',
          options: Options(headers: {
            'accept': 'application/json',
            'x-apikey': kApiKey,
            'Content-Type': 'application/json'
          }),
          data: {
            "_id": math.Random.secure().nextInt(1000),
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "notes": notes,
            "picture": picture,
            "phone": phone
          });

      return Either.right(
          AddUserSuccessSchema.fromJson(jsonDecode(response.data.toString())));
    } on DioException catch (ex) {
      return Either.left(appRepository.statusErrorHandler(ex.response));
    }
  }
}
