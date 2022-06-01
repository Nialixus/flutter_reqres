part of 'log_page.dart';

/// Login / Register form field.
class BottomPage extends StatelessWidget {
  /// Login form field.
  const BottomPage.login({Key? key})
      : _id = 0,
        super(key: key);

  /// Register form field.
  const BottomPage.register({Key? key})
      : _id = 1,
        super(key: key);

  /// Private identification of [BottomPage].
  final int _id;

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    const Color primaryColor = Color(0xff31428B);
    const Color secondaryColor = Color(0xff583A75);
    const LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [primaryColor, secondaryColor]);

    return DecoratedBox(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
        child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int x = 0; x < 2; x++)
                    //
                    // Form Fields
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        margin: EdgeInsets.only(
                            top: x == 0 ? 0 : 20.0,
                            bottom: x == 1 ? 20.0 : 0.0),
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            border: const Border(
                                bottom: BorderSide(
                              width: 3,
                              color: secondaryColor,
                            ))),
                        child: TextFormField(
                          controller: [email, password][x],
                          obscureText: x == 1,
                          decoration: InputDecoration(
                              hintText: [
                                "eve.holt@reqres.in",
                                ["cityslicka", "pistol"][_id]
                              ][x],
                              labelText: ["Email", "Password"][x],
                              labelStyle: const TextStyle(color: primaryColor),
                              border: InputBorder.none),
                        )),

                  /// Confirmation Button.
                  Container(
                      decoration: const BoxDecoration(gradient: gradient),
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () {
                                if (_id == 0) {
                                  context.read<LogAPICubit>().login(
                                      email: email.text,
                                      password: password.text);
                                } else {
                                  context.read<LogAPICubit>().register(
                                      email: email.text,
                                      password: password.text);
                                }
                              },
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Text(
                                    ["Login", "Register"][_id].toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))))),

                  /// Page Switcher Button.
                  Text.rich(
                    TextSpan(children: [
                      for (int x = 0; x < 2; x++)
                        TextSpan(
                            text: [
                              [
                                "Don't have an account yet? ",
                                "Already have an account? "
                              ][_id],
                              ["Register here", "Login here"][_id],
                            ][x],
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (x == 1) {
                                  email.clear();
                                  password.clear();
                                  context.read<LogSwitchCubit>().onTap();
                                }
                              },
                            style: x == 1
                                ? const TextStyle(
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold)
                                : const TextStyle())
                    ]),
                    textAlign: TextAlign.center,
                  )
                ])));
  }
}
