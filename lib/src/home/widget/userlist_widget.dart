part of "home_page.dart";

/// Widget to display list of [UserModel].
class UserListWidget extends StatelessWidget {
  /// Displaying list of [UserModel].
  const UserListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff31428B);
    const Color secondaryColor = Color(0xff583A75);
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 200,
      child:
          BlocBuilder<UserListCubit, UserListState>(builder: (context, state) {
        if (state is UserListSucceed) {
          return SingleChildScrollView(
              padding: EdgeInsets.only(left: width * 0.05),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(children: [
                for (int x = 0; x < state.model.data.length; x++)
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: width * 0.05),
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.1),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    secondaryColor.withOpacity(0.25),
                                    BlendMode.color),
                                image:
                                    NetworkImage(state.model.data[x].avatar))),
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
                            filter:
                                ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '${state.model.data[x].firstName} ${state.model.data[x].lastName}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Text(
                                  state.model.data[x].email,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12.0),
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                        create: (_) => UserCubit(
                                            id: state.model.data[x].id),
                                        child: const UserPage()))),
                          ),
                        ),
                      ))
                    ],
                  )
              ]));
        } else if (state is UserListFailed) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8.0,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: width * 0.75),
                child: Text(
                  state.message,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        } else {
          return SingleChildScrollView(
              padding: EdgeInsets.only(left: width * 0.05),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  for (int x = 0; x < 6; x++)
                    Container(
                      width: 150,
                      height: 200,
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(right: width * 0.05),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: LinearProgressIndicator(
                          color: Colors.white.withOpacity(0.1),
                          backgroundColor: Colors.white.withOpacity(0.1)),
                    )
                ],
              ));
        }
      }),
    );
  }
}
