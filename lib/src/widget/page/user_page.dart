import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff31428B);
    const Color secondaryColor = Color(0xff583A75);
    const LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, primaryColor, secondaryColor]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height / 2,
                child: Image.network("https://i.pravatar.cc/1500",
                    colorBlendMode: BlendMode.multiply,
                    fit: BoxFit.cover,
                    color: primaryColor.withOpacity(0.5))),
            DecoratedBox(
              decoration: const BoxDecoration(gradient: gradient),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: 1,
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                          actions: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                )),
                          ],
                        )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Janet Weaver",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text("janet.weaver@reqres.in",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5))),
                              Flexible(
                                  child: Text(
                                "\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                              )),
                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Tooltip(
                                        message:
                                            "\nTo keep ReqRes free, contributions towards server costs are appreciated!\n",
                                        verticalOffset: 40.0,
                                        child: Material(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: InkWell(
                                            onTap: () {},
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                                "Support Reqres",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Tooltip(
                                      message: "Like this sample",
                                      verticalOffset: 40.0,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                                width: 1, color: Colors.white)),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.transparent,
                                          child: InkWell(
                                              onTap: () {},
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Icon(
                                                  Icons.thumb_up_alt_rounded,
                                                  color: Colors.white,
                                                ),
                                              )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
