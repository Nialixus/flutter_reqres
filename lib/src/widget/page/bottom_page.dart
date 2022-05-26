part of "home_page.dart";

class BottomPage extends StatelessWidget {
  const BottomPage.login({Key? key})
      : _id = 0,
        _text = const [
          "Login",
          "Don't have an account yet? ",
          "Register here",
        ],
        super(key: key);

  const BottomPage.register({Key? key})
      : _id = 1,
        _text = const ["Register", "Already have an account? ", "Login here"],
        super(key: key);

  List<TextEditingController> get controllers =>
      List.filled(2, TextEditingController());

  final List<String> _text;
  final int _id;
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int x = 0; x < 2; x++)
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      margin: EdgeInsets.only(
                          top: x == 0 ? 0 : 20.0, bottom: x == 1 ? 20.0 : 0.0),
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          border: const Border(
                              bottom: BorderSide(
                            width: 3,
                            color: secondaryColor,
                          ))),
                      child: TextFormField(
                        obscureText: x == 1,
                        decoration: InputDecoration(
                            hintText: ["Email", "Password"][x],
                            border: InputBorder.none),
                      )),
                Container(
                  decoration: const BoxDecoration(gradient: gradient),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => [
                        context.read<APICubit>().login(
                            email: controllers[0].text,
                            password: controllers[1].text),
                        context.read<APICubit>().register(
                            email: controllers[0].text,
                            password: controllers[1].text)
                      ][_id],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          _text[0].toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(children: [
                    for (int x = 0; x < 2; x++)
                      TextSpan(
                          text: [
                            _text[1],
                            _text[2],
                          ][x],
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              if (x == 1) {
                                context.read<HomeCubit>().onTap();
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
              ]),
        ));
  }
}
