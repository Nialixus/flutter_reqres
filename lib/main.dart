import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/home/cubit/userlist_cubit.dart';

import 'src/home/cubit/resourcelist_cubit.dart';
import 'src/home/widget/home_page.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "REQRES API Sample",
      home: /*MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => APICubit()),
          BlocProvider(create: (_) => HomeCubit())
        ],
        child: const HomePage(),
      )*/
          MultiBlocProvider(providers: [
        BlocProvider(create: (_) => UserListCubit()),
        BlocProvider(create: (_) => ResourceListCubit())
      ], child: const HomePage())));
}
