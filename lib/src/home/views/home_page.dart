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
              if (state is ReadSuccessState<HomeData>) {
                return RefreshIndicator(
                  onRefresh: controller.run,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(Shared.value.spacing),
                    itemCount: state.data!.users.length,
                    itemBuilder: (_, index) => UserCard(
                      state.data!.users[index],
                      onTap: () {},
                      ignore: true,
                    ),
                  ),
                );
              } else if (state is ReadErrorState) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(Shared.value.spacing),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OOPS',
                        style: context.text.bodyLarge?.copyWith(
                          color: context.color.surface,
                          fontSize: Shared.value.spacing * 3.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: context.width,
                          constraints: const BoxConstraints(maxWidth: 600.0),
                          padding: EdgeInsets.symmetric(
                            vertical: Shared.value.spacing,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              state.message,
                              textAlign: TextAlign.justify,
                              style: context.text.bodyMedium?.copyWith(
                                color: context.color.surface.withOpacity(0.5),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkMaterial(
                        color: context.color.surface,
                        onTap: controller.run,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Shared.value.spacing * 2.0,
                            vertical: Shared.value.spacing * 0.5,
                          ),
                          child: Text(
                            'Reload',
                            style: context.text.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Skeletonizer(
                ignorePointers: false,
                child: ListView.builder(
                  padding: EdgeInsets.all(Shared.value.spacing),
                  itemBuilder: (_, __) => UserCard(
                    UserCardData.test(),
                    ignore: true,
                    onTap: () {},
                  ),
                ),
              );
            }),
      ),
    );
  }
}
