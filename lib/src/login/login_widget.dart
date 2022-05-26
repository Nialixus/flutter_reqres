import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api/src/login/login_cubit.dart';
import 'package:product_api/src/login/login_listener.dart';
import 'package:product_api/src/register/register_cubit.dart';
import 'package:product_api/src/register/register_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  List<TextEditingController> get controllers =>
      List.generate(2, (x) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff31428B);
    const Color secondaryColor = Color(0xff583A75);
    const LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [primaryColor, secondaryColor]);

    return LoginListener(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: DecoratedBox(
            decoration: const BoxDecoration(gradient: gradient),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Image.network(
                      "https://reqres.in/img/logo.png",
                      width: 150,
                      loadingBuilder: (_, child, progress) => progress == null
                          ? child
                          : const CircularProgressIndicator(
                              color: Colors.white),
                    )),
                const Expanded(
                    child: Center(
                        child: Text(
                  "Flutter Test with REQRES API",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ))),
                Container(
                    margin: const EdgeInsets.only(top: 40.0),
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          3,
                          (x) => x == 2
                              ? Container(
                                  decoration:
                                      const BoxDecoration(gradient: gradient),
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () =>
                                          context.read<LoginCubit>().login(
                                                username: controllers[0].text,
                                                password: controllers[1].text,
                                              ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Text(
                                          "Login".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
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
                                    obscureText: x == 1,
                                    decoration: InputDecoration(
                                        hintText: ["Email", "Password"][x],
                                        border: InputBorder.none),
                                  )),
                        )..add(Text.rich(
                            TextSpan(children: [
                              for (int x = 0; x < 2; x++)
                                TextSpan(
                                    text: [
                                      "Don't have an account yet? ",
                                      "Register here",
                                    ][x],
                                    style: x.isOdd
                                        ? const TextStyle(
                                            color: secondaryColor,
                                            fontWeight: FontWeight.bold)
                                        : const TextStyle())
                            ]),
                            textAlign: TextAlign.center,
                          )

                              /* Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account yet? "),
                              Flexible(
                                  child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => BlocProvider(
                                            create: (_) => RegisterCubit(),
                                            child: const RegisterPage()))),
                                child: Text(
                                  "Sign up here",
                                  style: ,
                              ))
                            ],
                          )*/
                              ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
