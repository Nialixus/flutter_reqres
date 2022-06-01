part of 'log_page.dart';

/// [LogAPICubit] listener.
class LogAPIListener extends StatelessWidget {
  /// Widget to listen changes in [LogAPICubit].
  const LogAPIListener({Key? key, required this.child}) : super(key: key);

  /// Child's listener.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogAPICubit, LogAPIState>(
      listener: (listen, state) {
        if (state is LogAPILoading) {
          //
          // Displaying loading circle.
          //
          showDialog(
              context: listen,
              builder: (_) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 7.5)));
        } else if (state is LogAPIFailed) {
          //
          // Displaying error message.
          //
          Navigator.pop(listen);
          showDialog(
              context: listen,
              builder: (_) => AlertDialog(
                  title: Text(state.messageTitle),
                  content: Text(state.messageContent)));
        } else if (state is LogAPISucceed) {
          //
          // Go to [HomePage].
          //
          Navigator.pop(listen);
          Navigator.push(
              listen,
              MaterialPageRoute(
                  builder: (_) => MultiBlocProvider(providers: [
                        BlocProvider(create: (_) => UserListCubit()),
                        BlocProvider(create: (_) => ResourceListCubit())
                      ], child: const HomePage())));
        }
      },
      child: child,
    );
  }
}
