part of 'home_page.dart';

/// Widget to display title of model list.
class TitleWidget extends StatelessWidget {
  /// Displaying Title of list.
  const TitleWidget({Key? key, required this.title, this.add})
      : super(key: key);

  /// Title of list.
  final String title;

  /// Choose wheter add button should be displayed or not.
  final bool? add;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        bottom: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Row(
        children: [
          // Title of list.
          Expanded(
              child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          )),

          // Add button.
          add == true
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.025),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                                value: UserCubit(),
                                child: const Center(child: AddPage())));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.025,
                            vertical: 4.0),
                        child: const Text.rich(
                          TextSpan(children: [
                            TextSpan(text: "Add "),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                ))
                          ]),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
