part of 'home_page.dart';

/// Displaying index page.
class Pagination extends StatelessWidget {
  /// Displaying index of user page.
  const Pagination.user({Key? key})
      : _id = 0,
        super(key: key);

  /// Displaying index of resource page.
  const Pagination.resource({Key? key})
      : _id = 1,
        super(key: key);

  /// Private identification of [Pagination].
  final int _id;

  @override
  Widget build(BuildContext context) {
    if (_id == 0) {
      return BlocBuilder<UserListCubit, UserListState>(builder: (_, state) {
        if (state is UserListSucceed) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int x = 0; x < state.model.totalPages; x++)
                Tooltip(
                  message: "Page ${x + 1}",
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () =>
                          context.read<UserListCubit>().fetching(page: x + 1),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: x == state.model.page - 1
                                ? Colors.white
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 16.0),
                        height: 7.5,
                        width: x == state.model.page - 1 ? 20.0 : 7.5,
                      ),
                    ),
                  ),
                )
            ],
          );
        }

        return const SizedBox();
      });
    }

    return BlocBuilder<ResourceListCubit, ResourceListState>(
        builder: (_, state) {
      if (state is ResourceListSucceed) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int x = 0; x < state.model.totalPages; x++)
              Tooltip(
                message: "Page ${x + 1}",
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () =>
                        context.read<ResourceListCubit>().fetching(page: x + 1),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: x == state.model.page - 1
                              ? Colors.white
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 16.0),
                      height: 7.5,
                      width: x == state.model.page - 1 ? 20.0 : 7.5,
                    ),
                  ),
                ),
              )
          ],
        );
      }

      return const SizedBox();
    });
  }
}
