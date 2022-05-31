part of 'user_page.dart';

class UserSucceedWidget extends StatelessWidget {
  const UserSucceedWidget({Key? key, required this.model}) : super(key: key);
  final SingleUserModel model;

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
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height / 2,
            child: Image.network(model.data.avatar,
                colorBlendMode: BlendMode.multiply,
                fit: BoxFit.cover,
                color: primaryColor.withOpacity(0.5))),
        Positioned(
            width: width,
            height: height,
            child: DecoratedBox(
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
                            PopupMenuButton(
                                tooltip: "Menu",
                                itemBuilder: (_) => [
                                      for (int y = 0; y < 2; y++)
                                        PopupMenuItem(
                                            onTap: () {
                                              Future.delayed(const Duration(
                                                      seconds: 1))
                                                  .then((value) {
                                                if (y == 0) {
                                                  showDialog(
                                                      context: _,
                                                      builder: (__) =>
                                                          BlocProvider.value(
                                                            value: UserCubit(
                                                                id: model
                                                                    .data.id),
                                                            child: Center(
                                                                child: EditPage(
                                                                    model:
                                                                        model)),
                                                          ));
                                                } else {
                                                  context
                                                      .read<UserCubit>()
                                                      .deleting(model.data.id)
                                                      .then((value) => ScaffoldMessenger
                                                              .of(context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  content: Text(
                                                                    value,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            secondaryColor),
                                                                  ))));
                                                }
                                              });
                                            },
                                            child: Text(["Edit", "Delete"][y]))
                                    ])
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
                              Text(
                                  model.data.firstName +
                                      " " +
                                      model.data.lastName,
                                  style: const TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(model.data.email,
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
                                        message: "\n${model.support.text}\n",
                                        verticalOffset: 40.0,
                                        child: Material(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: InkWell(
                                            onTap: () async => await launchUrl(
                                                Uri.parse(model.support.url)),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: const Padding(
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
                                              onTap: () async => launchUrl(
                                                  Uri.parse(
                                                      "https://github.com/Nialixus/flutter-reqres")),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
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
                              ),
                              SizedBox(
                                height: width * 0.05,
                              )
                            ]),
                      ),
                    )
                  ]),
            )),
      ],
    );
  }
}
