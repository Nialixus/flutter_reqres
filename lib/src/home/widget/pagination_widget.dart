part of 'home_page.dart';

class Pagination<B extends StateStreamable<S>, S> extends StatelessWidget {
  const Pagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (B is UserListCubit && S is UserListState ||
        B is ResourceListCubit && S is ResourceListState) {
      return BlocBuilder<B, S>(builder: ((context, state) {
        if (state is UserListSucceed || state is ResourceListSucceed) {
          UserListModel? userModels =
              state is UserListSucceed ? state.model : null;
          ResourceListModel? resourceModels =
              state is ResourceListSucceed ? state.model : null;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int x = 0;
                  x < (userModels?.data.length ?? resourceModels!.data.length);
                  x++)
                Tooltip(
                  message: "Page ${x + 1}",
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => B is UserListCubit
                          ? context.read<UserListCubit>().fetching(page: x + 1)
                          : context
                              .read<ResourceListCubit>()
                              .fetching(page: x + 1),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: x ==
                                    (userModels?.page ?? resourceModels!.page) -
                                        1
                                ? Colors.white
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 16.0),
                        height: 7.5,
                        width:
                            x == (userModels?.page ?? resourceModels!.page) - 1
                                ? 20.0
                                : 7.5,
                      ),
                    ),
                  ),
                )
            ],
          );
        } else {
          return const SizedBox();
        }
      }));
    } else {
      return ErrorWidget("Pagination State is missing");
    }
  }
}
