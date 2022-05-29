import 'package:flutter/material.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    const Color primaryColor = Color(0xff31428B);
    const Color secondaryColor = Color(0xff583A75);
    const LinearGradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [primaryColor, secondaryColor]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<String> texts = [
      "Name",
      "Funchisa Tone",
      "year",
      "2001",
      "Color",
      "#ff1234",
      "pantone value",
      "21-1294"
    ];
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.pop(context),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => print("Tap"),
            child: Container(
              margin: const EdgeInsets.only(top: 25.0),
              width: width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Resource",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  Text.rich(
                      TextSpan(children: [
                        const TextSpan(
                            text:
                                "To keep ReqRes free, contributions towards server costs are appreciated! "),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(Icons.open_in_new_rounded,
                                size: 14.0,
                                color: Colors.black.withOpacity(0.5)))
                      ]),
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Wrap(spacing: 8.0, runSpacing: 8.0, children: [
                    for (int x = 0; x < 4; x++)
                      Material(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                [
                                  Icons.title,
                                  Icons.date_range,
                                  Icons.color_lens,
                                  Icons.print
                                ][x],
                                size: 14.0,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                ["Name", "data", "Color", "pantone"][x]
                                    .toLowerCase(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      )
                  ]),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              margin: const EdgeInsets.only(right: 16.0),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: primaryColor),
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                Icons.color_lens,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
