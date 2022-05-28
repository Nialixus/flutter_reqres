import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reqres_test/src/widget/page/user_page.dart';

export 'dashboard_page.dart' hide contentTitle, header, resource, user;

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
                        user(context, width,
                            primaryColor: primaryColor,
                            secondaryColor: secondaryColor),
                        contentTitle(context, title: "Resource"),
                        resource(width)
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

Widget resource(double width) => SizedBox(
      width: width,
      height: 125,
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int x = 0; x < 10; x++)
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: x == 9 ? 25.0 : width * 0.05 + 25.0,
                        top: 25.0,
                      ),
                      child: Material(
                        color: x.isOdd ? Colors.red : Colors.orange,
                        borderRadius: BorderRadius.circular(10.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.0),
                          onTap: () {},
                          child: Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: const [
                                    Text("True red",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text("19-1664",
                                        style: TextStyle(fontSize: 10.0))
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                        top: 0,
                        right: 16.0,
                        child: Icon(
                          Icons.color_lens,
                          color: Colors.white,
                          size: 75.0,
                        ))
                  ],
                )
            ],
          )),
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
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.power_settings_new_rounded,
                color: Colors.white,
                size: 20.0,
              ))
        ]..insert(
            1,
            const SizedBox(
              width: 10.0,
            ))),
  );
}

Widget user(BuildContext context, double width,
        {required Color primaryColor, required Color secondaryColor}) =>
    SizedBox(
      width: width,
      height: 250,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: width * 0.05),
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (int x = 0; x < 10; x++)
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.05),
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              secondaryColor.withOpacity(0.25),
                              BlendMode.color),
                          image:
                              const NetworkImage("https://i.pravatar.cc/150"))),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          Text(
                            "name@mail.com",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding: EdgeInsets.only(right: width * 0.05),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      splashColor: primaryColor.withOpacity(0.25),
                      highlightColor: Colors.black.withOpacity(0.25),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const UserPage())),
                    ),
                  ),
                ))
              ],
            )
        ]),
      ),
    );

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
