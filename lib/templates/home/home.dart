import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/apps/app/app_repository.dart';
import 'package:phone_book/apps/helper/home_success_schema.dart';
import 'package:phone_book/apps/helper/router_schema.dart';
import 'package:phone_book/controllers/home/home_cubit.dart';
import 'package:phone_book/routes.dart';
import 'package:phone_book/templates/home/user_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(
                appRepository: context.read<AppRepository>(),
              ))
    ], child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          SnackBar snackBar = SnackBar(
            content: Text(state.message!),
          );
          if (state.status == HomeStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state.status == HomeStatus.initial) {
            context.read<HomeCubit>().getData();
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (state.status == HomeStatus.success) {
            final List<HomeSuccessSchema>? entries = state.data;
            return entries == null || entries.isEmpty
                ? const Center(
                    child: Text('Empty'),
                  )
                : ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      // log('**clasmas** ${entries[index].picture?.first()}');
                      return GestureDetector(
                        onTap: () {
                          Routes(context).navigate(
                              route: SelectRoute.userDetail,
                              argument: entries[index].id);
                        },
                        child: UserItem(
                            photo: entries[index].picture,
                            firstName: entries[index].firstName ?? '',
                            lastName: entries[index].lastName ?? '',
                            phone: entries[index].phone.toString()),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(height: 1),
                    itemCount: entries.length - 1);
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routes(context).navigate(route: SelectRoute.addUser);
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    ));
  }
}
