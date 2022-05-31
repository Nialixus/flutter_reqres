import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/log/widget/log_page.dart';
import 'src/log/cubit/log_api_cubit.dart';
import 'src/log/cubit/log_switch_cubit.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "REQRES API Sample",
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LogAPICubit()),
          BlocProvider(create: (_) => LogSwitchCubit())
        ],
        child: const LogPage(),
      )));
}
