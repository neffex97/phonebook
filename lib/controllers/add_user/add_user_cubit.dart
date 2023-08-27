import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:phone_book/apps/add_user/add_user_repository.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/add_user_success_schema.dart';
import 'package:phone_book/apps/helper/status_error_handler_schema.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit({
    required AppRepository appRepository,
  })  : _appRepository = appRepository,
        _addUserRepository = appRepository.addUserRepository,
        super(const AddUserState());

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final noteController = TextEditingController();

  final AppRepository _appRepository;
  final AddUserRepository _addUserRepository;
  final formKey = GlobalKey<FormState>();

  final nameInputFormatters = FilteringTextInputFormatter.allow(
    RegExp(r"[a-zA-Z]+|\s"),
  );
  final emailInputFormatters = FilteringTextInputFormatter.allow(
    RegExp(
        r"^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$"),
  );
  final phoneInputFormatters = FilteringTextInputFormatter.allow(
    RegExp(r"[0-9]"),
  );

  void validateForm() {
    // String nameError = _validateName(nameController.text);
    // String emailError = _validateEmail(emailController.text);

    // emit(state);
  }

  // String? validateName(String? name) {
  //   if (name == null || name.isEmpty) {
  //     return "Please enter your name";
  //   } else if (!name.isValidName) {
  //     return 'Enter valid name';
  //   } else {
  //     return null;
  //   }
  // }

  // String _validateEmail(String email) {
  //   if (email.isEmpty) {
  //     return "Please enter your email address";
  //   }

  //   if (!email.contains("@")) {
  //     return "Please enter a valid email address";
  //   }
  // }

  addUser(String firstName, String lastName, String email, String notes,
      String picture, String phone) async {
    Either<StatusErrorHandlerSchema, AddUserSuccessSchema> res =
        await _addUserRepository.addUser(_appRepository, firstName, lastName,
            email, notes, [picture], phone);

    res.match(
        (left) => emit(state.copyWith(
            status: () => AddUserStatus.error, message: () => left.message)),
        (right) => emit(state.copyWith(
            status: () => AddUserStatus.success, message: () => 'success')));
  }
}
