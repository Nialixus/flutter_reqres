import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api/src/register/register_cubit.dart';
import 'package:product_api/src/register/register_listener.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  List<TextEditingController> get controllers =>
      List.generate(3, (x) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return RegisterListener(
      child: Scaffold(
        backgroundColor: Colors.blue.shade800,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 60.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      4,
                      (x) => x == 3
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: MaterialButton(
                                onPressed: () =>
                                    context.read<RegisterCubit>().register(
                                          email: controllers[0].text,
                                          username: controllers[1].text,
                                          password: controllers[2].text,
                                        ),
                                color: Colors.blue.shade800,
                                child: Text(
                                  "Daftar".toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              margin: EdgeInsets.only(
                                  top: x == 0 ? 0 : 20.0,
                                  bottom: x == 2 ? 20.0 : 0.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade800.withOpacity(0.1),
                                  border: Border(
                                      bottom: BorderSide(
                                    width: 3,
                                    color: Colors.blue.shade800,
                                  ))),
                              child: TextFormField(
                                controller: controllers[x],
                                obscureText: x == 2,
                                decoration: InputDecoration(
                                    hintText: [
                                      "Email",
                                      "Username",
                                      "Password",
                                    ][x],
                                    border: InputBorder.none),
                              )),
                    )..addAll([
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Sudah punya akun? "),
                            Flexible(
                                child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Text(
                                "Login disini",
                                style: TextStyle(
                                    color: Colors.blue.shade800,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                          ],
                        )
                      ]))),
          ),
        ),
      ),
    );
  }
}
