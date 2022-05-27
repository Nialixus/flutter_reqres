part of 'page/home_page.dart';

class APIListener extends StatelessWidget {
  const APIListener({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<APICubit, APIState>(
      listener: (listen, state) {
        if (state is APILoginLoadingState) {
          showDialog(
              context: listen,
              builder: (_) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 7.5)));
        } else if (state is APILoginFailedState) {
          Navigator.pop(listen);
          showDialog(
              context: listen,
              builder: (_) => AlertDialog(
                  title: Text(state.messageTitle),
                  content: Text(state.messageContent)));
        } else if (state is APILoginSucceedState) {
          Navigator.pop(listen);
          Navigator.push(
            listen,
            MaterialPageRoute(builder: (_) => const Dashboard()),
          );
        }
      },
      child: child,
    );
  }
}
