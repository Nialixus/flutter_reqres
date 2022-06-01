import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user/cubit/user_cubit.dart';
import '../../user/widget/user_page.dart';
import '../../etc/extension/capitalize.dart';
import '../../etc/extension/colorstring.dart';
import '../../home/cubit/userlist_cubit.dart';
import '../../home/cubit/resourcelist_cubit.dart';
import '../../resource/cubit/resource_cubit.dart';
import '../../resource/widget/resource_page.dart';

part 'add_page.dart';
part 'title_widget.dart';
part 'userlist_widget.dart';
part 'pagination_widget.dart';
part 'resourcelist_widget.dart';

/// HomePage to display [UserListWidget] and [ResourceListWidget].
class HomePage extends StatelessWidget {
  /// User homepage.
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
              //
              // Background
              //
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(gradient: gradient),
                ),
              ),

              //
              // Homepage content
              //
              SizedBox(
                width: width,
                height: height,
                child: CustomScrollView(
                  slivers: [
                    _header(context),
                    SliverList(
                        delegate: SliverChildListDelegate(
                      const [
                        TitleWidget(title: "User", add: true),
                        UserListWidget(),
                        Pagination.user(),
                        TitleWidget(title: "Resource"),
                        ResourceListWidget(),
                        Pagination.resource(),
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

/// Homepage's header.
SliverAppBar _header(BuildContext context) {
  String logo =
      "https://user-images.githubusercontent.com/45191605/170668043-3b3ba0f0-7348-45a1-ab9f-b12744a35aa2.png";
  String textLogo =
      "https://user-images.githubusercontent.com/45191605/170668104-381e0df8-75bc-4b7e-b39d-f6d011be97f6.png";
  return SliverAppBar(
    automaticallyImplyLeading: false,
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
                onPressed: () => Navigator.pop(context),
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
