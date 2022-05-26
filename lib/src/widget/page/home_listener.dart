part of 'home_page.dart';

class APIListener extends StatelessWidget {
  const APIListener({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<APICubit, APIState>(
      listener: (context, state) {
        if (state is APILoading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (listen) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 7.5)));
        } else if (state is APIFailed) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (listen) => AlertDialog(
                  title: Text(state.messageTitle),
                  content: Text(state.messageContent)));
        } else if (state is APISucceed) {
          Navigator.pop(context);
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (listen) => const ChecklistPage()),
          );*/
        } else {
          // do nothing
        }
      },
      child: child,
    );
  }
}
