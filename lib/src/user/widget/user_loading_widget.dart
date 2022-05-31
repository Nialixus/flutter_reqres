part of 'user_page.dart';

class UserLoadingWidget extends StatelessWidget {
  const UserLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, Color(0xff31428B), Color(0xff583A75)]);
    double padding = MediaQuery.of(context).size.width * 0.05;
    LinearProgressIndicator indicator = LinearProgressIndicator(
      color: Colors.white.withOpacity(0.1),
      backgroundColor: Colors.white.withOpacity(0.1),
    );

    return Stack(
      children: [
        const Positioned.fill(
          child: DecoratedBox(decoration: BoxDecoration(gradient: gradient)),
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                height: kToolbarHeight,
                child: indicator,
              ),
              Expanded(
                  child: Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.symmetric(vertical: padding),
                child: indicator,
              )),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: kToolbarHeight,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: indicator,
                    margin: EdgeInsets.only(right: padding),
                  )),
                  Container(
                    width: kToolbarHeight,
                    height: kToolbarHeight,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: indicator,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
