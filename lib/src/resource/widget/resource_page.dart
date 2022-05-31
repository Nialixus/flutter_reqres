import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reqres_test/src/etc/extension/capitalize.dart';
import 'package:flutter_reqres_test/src/resource/cubit/resource_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff31428B);
    double width = MediaQuery.of(context).size.width;
    LinearProgressIndicator indicator = LinearProgressIndicator(
      color: primaryColor.withOpacity(0.1),
      backgroundColor: primaryColor.withOpacity(0.1),
    );

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.pop(context),
      child: BlocBuilder<ResourceCubit, ResourceState>(builder: (_, state) {
        if (state is ResourceFailed) {
          return Container(
            padding: EdgeInsets.all(width * 0.05),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    state.message,
                    style: const TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
          );
        } else if (state is ResourceSucceed) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () async =>
                    await launchUrl(Uri.parse(state.model.support.url)),
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
                            TextSpan(text: state.model.support.text),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(Icons.open_in_new_rounded,
                                    size: 14.0,
                                    color: Colors.black.withOpacity(0.5)))
                          ]),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5))),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Wrap(spacing: 8.0, runSpacing: 8.0, children: [
                        for (int x = 0; x < 4; x++)
                          Material(
                            color: state.model.data.color,
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
                                    [
                                      state.model.data.name,
                                      state.model.data.year.toString(),
                                      state.model.data.color.asString(),
                                      state.model.data.pantoneValue
                                    ][x]
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
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: state.model.data.color),
                  padding: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.color_lens,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container(
            padding: EdgeInsets.all(width * 0.05),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: width * 0.05),
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  width: width * 0.75,
                  height: kToolbarHeight,
                  child: indicator,
                ),
                Row(
                  children: List.filled(
                      4,
                      Expanded(
                        child: Container(
                          height: 20.0,
                          margin: EdgeInsets.only(right: width * 0.05),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: indicator,
                        ),
                      )),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
