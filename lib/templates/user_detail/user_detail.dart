import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/controllers/user_detail/user_detail_cubit.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({required String id, super.key}) : _id = id;

  final String _id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserDetailCubit>(
              create: (BuildContext context) => UserDetailCubit(
                    appRepository: context.read<AppRepository>(),
                  ))
        ],
        child: UserDetailView(
          id: _id,
        ));
  }
}

class UserDetailView extends StatelessWidget {
  const UserDetailView({required String id, super.key}) : _id = id;

  final String _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
        backgroundColor: Colors.black,
      ),
      body: BlocConsumer<UserDetailCubit, UserDetailState>(
        builder: (context, state) {
          if (state.status == UserDetailStatus.initial) {
            context.read<UserDetailCubit>().getData(_id);
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state.status == UserDetailStatus.success) {
            return Center(
                child: Column(
              children: [
                Text(state.data?.firstName ?? ''),
                Text(state.data?.lastName ?? ''),
                Text(state.data?.phone.toString() ?? ''),
                Text(state.data?.notes ?? ''),
                Text(state.data?.email ?? ''),
              ],
            ));
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.warning, size: 50),
                Text(state.message!)
              ],
            ),
          );
        },
        listener: (context, state) {
          SnackBar snackBar = SnackBar(
            content: Text(state.message!),
          );
          if (state.status == UserDetailStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }
}
