part of 'home_page.dart';

class ResourceListWidget extends StatelessWidget {
  const ResourceListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 125,
      child: BlocBuilder<ResourceListCubit, ResourceListState>(
          builder: (context, state) {
        if (state is ResourceListSucceed) {
          return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: width * 0.05),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int x = 0; x < state.model.data.length; x++)
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: width * 0.05,
                            top: 25.0,
                          ),
                          child: Material(
                            color: state.model.data[x].color,
                            borderRadius: BorderRadius.circular(10.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              onTap: () => showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.black.withOpacity(0.85),
                                  builder: (_) => const ResourcePage()),
                              child: Container(
                                width: 100,
                                height: 100,
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0))),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(state.model.data[x].name.toCaps(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            state.model.data[x].color
                                                .asString(),
                                            style:
                                                const TextStyle(fontSize: 10.0))
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                            top: 0,
                            right: 16.0,
                            child: IgnorePointer(
                              child: Icon(
                                Icons.color_lens,
                                color: Colors.white,
                                size: 75.0,
                              ),
                            ))
                      ],
                    )
                ],
              ));
        } else {
          return Container();
        }
      }),
    );
  }
}
