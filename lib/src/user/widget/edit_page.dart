part of 'user_page.dart';

/// Widget to call [UserCubit.updating].
class EditPage extends StatelessWidget {
  /// Updating API by calling [UserCubit.updating].
  const EditPage({Key? key, required this.model}) : super(key: key);

  /// User Model from API.
  final SingleUserModel model;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff31428B);
    const Color secondaryColor = Color(0xff583A75);
    const LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [primaryColor, secondaryColor]);
    double width = MediaQuery.of(context).size.width;
    TextEditingController name = TextEditingController();
    TextEditingController job = TextEditingController();

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        //
        // ReqRes Update
        //
        Material(
          color: Colors.transparent,
          child: Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              padding: EdgeInsets.all(width * 0.05),
              constraints: BoxConstraints(
                  maxWidth: 250.0 > width * 0.75 ? 250.0 : width * 0.75,
                  minWidth: 250.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int x = 0; x < 2; x++)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        margin: const EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          controller: [name, job][x],
                          decoration: InputDecoration(
                              hintText: ["morpheus", "zion resident"][x],
                              labelStyle: const TextStyle(color: primaryColor),
                              labelText: ["Name", "Job"][x],
                              border: InputBorder.none),
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: gradient,
                          borderRadius: BorderRadius.circular(10.0)),
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => context
                              .read<UserCubit>()
                              .updating(model.data.id,
                                  name: name.text, job: job.text)
                              .then((value) {
                            //
                            // Show snackbar after updating API.
                            //
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                  value,
                                  style: const TextStyle(color: secondaryColor),
                                )));

                            Navigator.pop(context);
                          }),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              "Update".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),

        //
        // ReqRes Logo
        //
        Transform.translate(
            offset: const Offset(0, -35),
            child: Container(
              width: 70.0,
              height: 70.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12.5),
              child: Image.network(
                "https://user-images.githubusercontent.com/45191605/170668043-3b3ba0f0-7348-45a1-ab9f-b12744a35aa2.png",
                color: primaryColor,
              ),
            ))
      ],
    );
  }
}
