part of '../login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginRequest controller = context.read<LoginRequest>();

    return Scaffold(
      backgroundColor: context.color.primary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GradientBackground(
          height: context.height,
          minHeight: 600.0,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: DImage(
                    source: Shared.value.fullLogo,
                    size: const Size.square(150),
                  ),
                ),
              ),
              Container(
                width: context.width,
                margin: EdgeInsets.symmetric(
                  horizontal: Shared.value.spacing * 0.5,
                ),
                constraints: const BoxConstraints(maxWidth: 350.0),
                padding: EdgeInsets.symmetric(
                  vertical: Shared.value.spacing * 2.0,
                  horizontal: Shared.value.spacing * 1.5,
                ),
                decoration: BoxDecoration(
                  color: context.color.surface,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: Shared.value.spacing * 5.0,
                      color: context.color.error.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...List.generate(
                      2,
                      (index) {
                        bool isFirst = index == 0;

                        return TextArea(
                          padding: EdgeInsets.symmetric(
                            horizontal: Shared.value.spacing * 0.5,
                          ),
                          margin: isFirst
                              ? null
                              : EdgeInsets.symmetric(
                                  vertical: Shared.value.spacing),
                          controller: [
                            controller.email,
                            controller.password,
                          ][index],
                          obscure: !isFirst,
                          hint: ['eve.holt@reqres.in', 'cityslicka'][index],
                          label: ["Email", "Password"][index],
                          onSubmitted: (_) {
                            if (isFirst) {
                              controller.password.focusNode.requestFocus();
                            } else {
                              controller.run();
                            }
                          },
                        );
                      },
                    ),
                    BlocConsumer(
                        bloc: controller,
                        listener: (context, state) {
                          if (state is WriteErrorState) {
                            context.showSnackbar(
                              level: DLevel.error,
                              message: state.message,
                            );
                          } else if (state is WriteFailedState<FocusNode>) {
                            context.showSnackbar(
                              level: DLevel.warning,
                              message: state.message,
                            );

                            state.data!.requestFocus();
                          } else if (state is WriteSuccessState) {
                            context.replace(Shared.route.home.path);
                          }
                        },
                        builder: (context, state) {
                          if (state is WriteLoadingState) {
                            return GradientButton(
                              onTap: () {},
                              padding: EdgeInsets.symmetric(
                                  vertical: Shared.value.spacing * 0.5),
                              child: Container(
                                alignment: Alignment.center,
                                width: Shared.value.spacing,
                                height: Shared.value.spacing,
                                child: CircularProgressIndicator(
                                  color: context.color.surface,
                                ),
                              ),
                            );
                          }

                          return GradientButton(
                            onTap: controller.run,
                            padding: EdgeInsets.symmetric(
                                vertical: Shared.value.spacing * 0.5),
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: context.text.bodyMedium?.copyWith(
                                color: context.color.surface,
                              ),
                            ),
                          );
                        }),
                    Padding(
                      padding: EdgeInsets.only(top: Shared.value.spacing * 0.5),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "Don't have an account yet? "),
                            TextSpan(
                              text: 'Register here',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.showSnackbar(
                                    level: DLevel.warning,
                                    message:
                                        'Feature has not been implemented!'),
                              style: TextStyle(color: context.color.secondary),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: context.text.bodyMedium?.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'ReqRes.in Demo by Louis Wiwawan',
                style: context.text.bodySmall?.copyWith(
                  height: Shared.value.spacing * 0.15,
                  fontSize: 6.0,
                  color: context.color.surface,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
