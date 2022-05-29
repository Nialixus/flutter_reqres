import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/etc/extension/capitalize.dart';
import 'package:flutter_reqres_test/src/home/cubit/resourcelist_cubit.dart';
import 'package:flutter_reqres_test/src/home/cubit/userlist_cubit.dart';
import 'package:flutter_reqres_test/src/home/model/resourcelist_model.dart';
import 'package:flutter_reqres_test/src/home/model/user_model.dart';
import 'package:flutter_reqres_test/src/home/model/userlist_model.dart';
import '../../user/widget/user_page.dart';
import 'resource_page.dart';

part 'userlist_widget.dart';
part 'pagination_widget.dart';
part 'resourcelist_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff31428B);
    const Color secondaryColor = Color(0xff583A75);
    const LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [primaryColor, secondaryColor]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(gradient: gradient),
                ),
              ),
              SizedBox(
                width: width,
                height: height,
                child: CustomScrollView(
                  slivers: [
                    header,
                    SliverList(
                        delegate: SliverChildListDelegate(
                      [
                        contentTitle(context, title: "User", add: true),
                        const UserListWidget(),
                        const Pagination<UserListCubit, UserListState>(),
                        contentTitle(context, title: "Resource"),
                        const ResourceListWidget(),
                        const Pagination<ResourceListCubit,
                            ResourceListState>(),
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Widget pagination() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int x = 0; x < 2; x++)
          GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 750),
              decoration: BoxDecoration(
                  color: [Colors.white, Colors.grey][x],
                  borderRadius: BorderRadius.circular(10.0)),
              margin:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
              height: 7.5,
              width: [20.0, 7.5][x],
            ),
          )
      ],
    );

SliverAppBar get header {
  String logo =
      "https://user-images.githubusercontent.com/45191605/170668043-3b3ba0f0-7348-45a1-ab9f-b12744a35aa2.png";
  String textLogo =
      "https://user-images.githubusercontent.com/45191605/170668104-381e0df8-75bc-4b7e-b39d-f6d011be97f6.png";
  return SliverAppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 80.0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int x = 0; x < 2; x++)
            Image.network(
              [logo, textLogo][x],
              height: [20.0, 10.0][x],
              color: Colors.white,
            ),
          const Spacer(),
          Tooltip(
            message: "Log out",
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.power_settings_new_rounded,
                  color: Colors.white,
                  size: 20.0,
                )),
          )
        ]..insert(
            1,
            const SizedBox(
              width: 10.0,
            ))),
  );
}

Widget contentTitle(BuildContext context, {required String title, bool? add}) =>
    Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        bottom: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          )),
          add == true
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.025),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {
                        print("tap");
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.025,
                            vertical: 4.0),
                        child: const Text.rich(
                          TextSpan(children: [
                            TextSpan(text: "Add "),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                ))
                          ]),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
