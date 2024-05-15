part of '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeRequest controller = context.read<HomeRequest>();

    return Scaffold(
      backgroundColor: context.color.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: Shared.value.spacing,
        toolbarHeight: kToolbarHeight,
        surfaceTintColor: Colors.transparent,
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
                    color: context.color.primary,
                  ),
                );
              },
            ),
            const Spacer(),
            Tooltip(
              message: "Log out",
              child: IconButton(
                onPressed: () => Login.session
                    .delete()
                    .then((_) => context.replace(Shared.route.login.path)),
                icon: Icon(
                  Icons.power_settings_new_rounded,
                  color: context.color.primary,
                  size: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
      body: BlocConsumer(
          bloc: controller,
          listener: (_, state) {
            if (state is ReadErrorState<SharedResponse>) {
              context.replace(Shared.route.login.path);
            }
          },
          builder: (context, state) {
            if (state is ReadSuccessState<HomeData>) {
              return RefreshIndicator(
                onRefresh: controller.run,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(Shared.value.spacing),
                  itemCount: state.data!.users.length,
                  itemBuilder: (_, index) => UserCard(
                    state.data!.users[index],
                    ignore: true,
                  ),
                ),
              );
            } else if (state is ReadErrorState) {
              return ErrorPage(
                message: state.message,
                onReload: controller.run,
              );
            }

            return Skeletonizer(
              ignorePointers: false,
              effect: LoadingBackground(
                duration: Shared.value.delay,
                color: Color.lerp(
                  context.color.surface,
                  context.color.primary,
                  0.35,
                )!,
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(Shared.value.spacing),
                itemBuilder: (_, __) => UserCard(
                  UserData.test(),
                  ignore: true,
                ),
              ),
            );
          }),
    );
  }
}
