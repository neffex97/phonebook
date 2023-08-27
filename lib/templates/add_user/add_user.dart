import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/router_schema.dart';
import 'package:phone_book/controllers/add_user/add_user_cubit.dart';
import 'package:phone_book/routes.dart';
import 'package:phone_book/templates/add_user/custom_form_field.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AddUserCubit>(
          create: (BuildContext context) => AddUserCubit(
                appRepository: context.read<AppRepository>(),
              ))
    ], child: const AddUserView());
  }
}

class AddUserView extends StatelessWidget {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Add User'), backgroundColor: Colors.black),
        body:
            BlocConsumer<AddUserCubit, AddUserState>(builder: (context, state) {
          return Form(
              key: context.read<AddUserCubit>().formKey,
              child: Column(
                children: [
                  CustomFormField(
                    controller:
                        context.read<AddUserCubit>().firstNameController,
                    hintText: 'First Name',
                    // inputFormatters: [
                    //   context.read<AddUserCubit>().nameInputFormatters
                    // ],
                    // validator: context.read<AddUserCubit>().validateName,
                  ),
                  CustomFormField(
                    controller: context.read<AddUserCubit>().lastNameController,
                    hintText: 'Last Name',
                    // inputFormatters: [
                    //   context.read<AddUserCubit>().nameInputFormatters
                    // ],
                    // validator: (String? val) {
                    //   if (!val!.isValidName) return 'Enter valid name';
                    //   return null;
                    // },
                  ),
                  CustomFormField(
                    controller: context.read<AddUserCubit>().emailController,
                    hintText: 'Email',
                    // inputFormatters: [
                    //   context.read<AddUserCubit>().emailInputFormatters
                    // ],
                    // validator: (String? val) {
                    //   if (!val!.isValidEmail) return 'Enter valid email';
                    //   return null;
                    // },
                  ),
                  CustomFormField(
                    controller: context.read<AddUserCubit>().phoneController,
                    hintText: 'Phone',
                    // inputFormatters: [
                    //   context.read<AddUserCubit>().phoneInputFormatters
                    // ],
                    // validator: (String? val) {
                    //   if (!val!.isValidPhone) return 'Enter valid phone';
                    //   return null;
                    // },
                  ),
                  CustomFormField(
                    controller: context.read<AddUserCubit>().noteController,
                    hintText: 'Note',

                    // validator: (String? val) {
                    //   if (!val!.isValidPassword) return 'Enter valid password';
                    //   return null;
                    // },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // context
                      //     .read<AddUserCubit>()
                      //     .formKey
                      //     .currentState!
                      //     .validate();

                      context.read<AddUserCubit>().addUser(
                          context.read<AddUserCubit>().firstNameController.text,
                          context.read<AddUserCubit>().lastNameController.text,
                          context.read<AddUserCubit>().emailController.text,
                          context.read<AddUserCubit>().noteController.text,
                          'empty',
                          context.read<AddUserCubit>().phoneController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text('Submit'),
                  )
                ],
              ));
        }, listener: (context, state) {
          SnackBar snackBar = SnackBar(
            content: Text(state.message),
          );
          if (state.status == AddUserStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state.status == AddUserStatus.success) {
            Routes(context).navigate(route: SelectRoute.home);
          }
        }));
  }
}
