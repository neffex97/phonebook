import 'package:phone_book/apps/add_user/add_user.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/add_user_success_schema.dart';
import 'package:phone_book/apps/helper/status_error_handler_schema.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAddUserRepository {
  Future<Either<StatusErrorHandlerSchema, AddUserSuccessSchema>> addUser(
      AppRepository appRepository,
      String firstName,
      String lastName,
      String email,
      String notes,
      List<String> picture,
      String phone);
}

class AddUserRepository implements IAddUserRepository {
  AddUserRepository({required AddUser addUser}) : _addUser = addUser;

  final AddUser _addUser;

  @override
  Future<Either<StatusErrorHandlerSchema, AddUserSuccessSchema>> addUser(
          AppRepository appRepository,
          String firstName,
          String lastName,
          String email,
          String notes,
          List<String> picture,
          String phone) async =>
      _addUser.addUser(
          appRepository, firstName, lastName, email, notes, picture, phone);
}
