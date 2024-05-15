part of '../user.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserRequest controller = context.read<UserRequest>();

    return Scaffold(
      backgroundColor: context.color.primary,
      body: BlocConsumer(
          bloc: controller,
          listener: (context, state) {
            if (state is ReadErrorState<SharedResponse>) {
              context.replace(Shared.route.login.path);
            }
          },
          builder: (context, state) {
            if (state is ReadErrorState) {
              return ErrorPage(
                message: state.message,
                onReload: controller.run,
              );
            } else if (state is ReadSuccessState<UserData>) {
              return UserPage.body(context, data: state.data as UserData);
            } else {
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
                child: UserPage.body(
                  context,
                  data: UserData.test(),
                ),
              );
            }
          }),
    );
  }

  static Widget body(
    BuildContext context, {
    bool ignore = false,
    required UserData data,
  }) {
    return RefreshIndicator(
      onRefresh: () async {
        if (!ignore) context.read<UserRequest>().run();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: UserHeader(data, ignore: ignore),
          ),
          SliverFillRemaining(
            child: Skeleton.ignore(
              ignore: ignore,
              child: Container(
                padding: EdgeInsets.all(Shared.value.spacing),
                color: context.color.surface,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: Shared.value.spacing),
                        child: SingleChildScrollView(
                          child: Text(
                            Shared.value.lipsum,
                            textAlign: TextAlign.justify,
                            style: context.text.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 2; i++)
                          Expanded(
                            child: GradientButton(
                              onTap: () => launchUrl(
                                Uri.parse(
                                  [
                                    'https://github.com/Nialixus/flutter_reqres',
                                    'http://reqres.in'
                                  ][i],
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: Shared.value.spacing,
                                vertical: Shared.value.spacing * 0.5,
                              ),
                              margin: EdgeInsets.only(
                                left: i == 1 ? Shared.value.spacing * 0.5 : 0.0,
                                right:
                                    i == 0 ? Shared.value.spacing * 0.5 : 0.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: Shared.value.spacing),
                                    child: Icon(
                                      [Icons.thumb_up, Icons.favorite][i],
                                      color: context.color.surface,
                                    ),
                                  ),
                                  Text(
                                    ['Like', 'Support'][i],
                                    style: context.text.bodyMedium?.copyWith(
                                      color: context.color.surface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
