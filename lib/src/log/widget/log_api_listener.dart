part of 'log_page.dart';

class LogAPIListener extends StatelessWidget {
  const LogAPIListener({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogAPICubit, LogAPIState>(
      listener: (listen, state) {
        if (state is LogAPILoading) {
          showDialog(
              context: listen,
              builder: (_) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 7.5)));
        } else if (state is LogAPIFailed) {
          Navigator.pop(listen);
          showDialog(
              context: listen,
              builder: (_) => AlertDialog(
                  title: Text(state.messageTitle),
                  content: Text(state.messageContent)));
        } else if (state is LogAPISucceed) {
          Navigator.pop(listen);
          Navigator.push(
            listen,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
      },
      child: child,
    );
  }
}
