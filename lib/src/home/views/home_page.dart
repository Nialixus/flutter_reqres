part of '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeRequest controller = context.read<HomeRequest>();

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: kToolbarHeight,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...[Shared.value.justLogo, Shared.value.textLogo].to(
                (index, item) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: Shared.value.spacing * 0.6,
                    ),
                    child: DImage(
                      source: item,
                      size: [
                        Size.square(Shared.value.spacing * 1.5),
                        Size(
                          Shared.value.spacing * 3,
                          Shared.value.spacing * 0.5,
                        )
                      ][index],
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const Spacer(),
              Tooltip(
                message: "Log out",
                child: IconButton(
                  onPressed: () => Login.store
                      .delete()
                      .then((_) => context.replace(Shared.route.login.path)),
                  icon: const Icon(
                    Icons.power_settings_new_rounded,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              )
            ],
          ),
        ),
        body: BlocConsumer(
            bloc: controller,
            listener: (_, __) {
              print(__);
            },
            builder: (context, state) {
              if (state is ReadSuccessState) {
              } else if (state is ReadLoadingState) {}
              return ListView.builder(
                padding: EdgeInsets.all(Shared.value.spacing),
                itemBuilder: (context, _) {
                  return UserCard(UserCardData.test());
                },
              );
            }),
      ),
    );
  }
}
