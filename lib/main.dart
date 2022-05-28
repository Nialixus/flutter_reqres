import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/cubit/home_cubit.dart';
import 'package:flutter_reqres_test/src/widget/page/home_page.dart';

import 'src/cubit/api_cubit.dart';
import 'src/widget/page/prehome_page.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "REQRES API Sample",
      home: /*MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => APICubit()),
          BlocProvider(create: (_) => HomeCubit())
        ],
        child: const HomePage(),
      )*/
          HomePage()));
}
