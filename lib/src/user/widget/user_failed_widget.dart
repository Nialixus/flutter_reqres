part of 'user_page.dart';

/// Widget where [UserCubit.fetching] end up failed.
class UserFailedWidget extends StatelessWidget {
  /// Display error message from [UserCubit.fetching].
  const UserFailedWidget({Key? key, required this.message}) : super(key: key);

  /// Error message to display.
  final String message;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff31428B);
    const Color secondaryColor = Color(0xff583A75);
    const LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, primaryColor, secondaryColor]);
    double width = MediaQuery.of(context).size.width;
    return ColoredBox(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              // Alert Icon
              //
              const Icon(
                Icons.error_outline,
                color: primaryColor,
              ),

              //
              // Error Message
              //
              Container(
                  margin: EdgeInsets.only(bottom: width * 0.05, top: 8.0),
                  constraints: BoxConstraints(maxWidth: width * 0.75),
                  child: Text(
                    message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: const TextStyle(color: primaryColor),
                    textAlign: TextAlign.center,
                  )),

              //
              // Back Button
              //
              Center(
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: const BoxDecoration(
                            gradient: gradient,
                          ),
                          child: Text("Back".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )))))
            ]));
  }
}
