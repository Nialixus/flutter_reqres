import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/log/cubit/log_switch_cubit.dart';

import '../../home/widget/home_page.dart';
import '../../log/cubit/log_api_cubit.dart';
part 'log_page_bottom.dart';
part 'log_api_listener.dart';

class PreHomePage extends StatelessWidget {
  const PreHomePage({Key? key}) : super(key: key);

  List<TextEditingController> get controllers =>
      List.generate(2, (x) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return LogAPIListener(
        child: Scaffold(
            backgroundColor: const Color(0xff31428B),
            body: DecoratedBox(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff31428B), Color(0xff583A75)])),
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Positioned(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SafeArea(
                          child: Column(children: [
                        Expanded(
                            flex: 2,
                            child: Center(
                                child: Image.network(
                                    "https://reqres.in/img/logo.png",
                                    width: 150,
                                    loadingBuilder: (_, child, progress) =>
                                        progress == null
                                            ? child
                                            : const CircularProgressIndicator(
                                                color: Colors.white,
                                              )))),
                        const Expanded(
                            flex: 1,
                            child: Text(
                              "Flutter test with REQRES API",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Expanded(
                          flex: 3,
                          child: BlocBuilder<LogSwitchCubit, bool>(
                              builder: ((context, state) => state
                                  ? const BottomPage.login()
                                  : const BottomPage.register())),
                        )
                      ])))
                ]))));
  }
}
