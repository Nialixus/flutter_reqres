part of 'user_page.dart';

/// Widget where [UserCubit.fetching] end succesfully.
class UserSucceedWidget extends StatelessWidget {
  /// Display [SingleUserModel] data from [UserCubit.fetching].
  const UserSucceedWidget({Key? key, required this.model}) : super(key: key);

  /// User Model from API
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
    return Stack(children: [
      //
      // User Picture
      //
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: height / 2,
          child: Image.network(model.data.avatar,
              colorBlendMode: BlendMode.multiply,
              fit: BoxFit.cover,
              color: primaryColor.withOpacity(0.5))),

      //
      // User Content
      //
      Positioned(
          width: width,
          height: height,
          child: DecoratedBox(
              decoration: const BoxDecoration(gradient: gradient),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //
                    // Header
                    //
                    Expanded(
                        flex: 1,
                        child: AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                            actions: [
                              _menuButton(context,
                                  secondaryColor: secondaryColor, model: model)
                            ])),

                    //
                    // GET: Single User Data
                    //
                    Expanded(
                        flex: 2,
                        child: _singleUserData(
                          width,
                          model: model,
                          secondaryColor: secondaryColor,
                        ))
                  ])))
    ]);
  }
}

/// Menu Button
Widget _menuButton(BuildContext context,
        {required Color secondaryColor, required SingleUserModel model}) =>
    PopupMenuButton(
        tooltip: "Menu",
        itemBuilder: (_) => [
              for (int y = 0; y < 2; y++)
                PopupMenuItem(
                    onTap: () {
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        if (y == 0) {
                          //
                          // PUT : Update ResReq
                          //
                          showDialog(
                              context: _,
                              builder: (__) => BlocProvider.value(
                                  value: UserCubit(id: model.data.id),
                                  child: Center(
                                      child: EditPage(
                                    model: model,
                                  ))));
                        } else {
                          //
                          // DELETE : Delete ResReq
                          //
                          context
                              .read<UserCubit>()
                              .deleting(model.data.id)
                              .then((value) => ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.white,
                                      content: Text(value,
                                          style: TextStyle(
                                            color: secondaryColor,
                                          )))));
                        }
                      });
                    },
                    child: Text(
                      ["Edit", "Delete"][y],
                    ))
            ]);

/// GET: Single User
Widget _singleUserData(double width,
        {required Color secondaryColor, required SingleUserModel model}) =>
    Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //
              // User Name
              //
              Text(model.data.firstName + " " + model.data.lastName,
                  style: const TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),

              //
              // User Email
              //
              Text(model.data.email,
                  style: TextStyle(color: Colors.white.withOpacity(0.5))),

              //
              // User Detail Sample
              //
              Flexible(
                  child: Text(
                      "\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n",
                      style: TextStyle(color: Colors.white.withOpacity(0.5)))),

              //
              // External Link
              //
              IntrinsicHeight(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    //
                    // Support ReqRes Link
                    //
                    Expanded(
                        child: Tooltip(
                            message: "\n${model.support.text}\n",
                            verticalOffset: 40.0,
                            child: Material(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(10.0),
                                child: InkWell(
                                    onTap: () async => await launchUrl(
                                        Uri.parse(model.support.url)),
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text("Support Reqres",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontWeight: FontWeight.bold,
                                            ))))))),

                    //
                    // Github Sample
                    //
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Tooltip(
                            message: "Like this sample",
                            verticalOffset: 40.0,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () async => launchUrl(Uri.parse(
                                            "https://github.com/Nialixus/flutter-reqres")),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Icon(
                                              Icons.thumb_up_alt_rounded,
                                              color: Colors.white,
                                            )))))))
                  ])),
              SizedBox(
                height: width * 0.05,
              )
            ]));
