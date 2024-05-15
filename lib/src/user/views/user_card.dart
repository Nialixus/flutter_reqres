part of '../user.dart';

class UserCard extends StatelessWidget {
  const UserCard(
    this.data, {
    super.key,
    this.ignore = false,
  });
  final UserData data;
  final bool ignore;

  @override
  Widget build(BuildContext context) {
    return Skeleton.ignorePointer(
      ignore: ignore,
      child: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: context.width * 0.75,
          width: context.width,
          constraints: const BoxConstraints(
            maxWidth: 600.0,
            maxHeight: 600.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Shared.value.spacing * 0.25),
            boxShadow: [
              BoxShadow(
                blurRadius: Shared.value.spacing * 0.5,
                color: context.color.secondary.withOpacity(0.5),
              ),
            ],
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: Shared.value.spacing),
          child: InkMaterial(
              onTap: () => context.go(
                    '/${Shared.route.user.path.replaceAll(':id', '${data.id}')}',
                  ),
              color: context.color.surface,
              child: Padding(
                padding: EdgeInsets.all(Shared.value.spacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: Shared.value.spacing * 2.0,
                          height: Shared.value.spacing * 2.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: DImage(source: data.avatar),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Shared.value.spacing * 0.75,
                              right: Shared.value.spacing * 0.25,
                            ),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: '${data.fullName} '),
                                  WidgetSpan(
                                    child: Container(
                                      width: Shared.value.spacing,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.color.primary,
                                      ),
                                      padding: EdgeInsets.all(
                                        Shared.value.spacing * 0.1,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: context.color.surface,
                                        size: Shared.value.spacing * 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: context.color.onSurface,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Shared.value.spacing * 0.5,
                        ),
                        color: context.color.primary,
                        child: DImage(
                          source: data.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 2; i++)
                          Padding(
                            padding: EdgeInsets.only(
                              right: Shared.value.spacing * 0.75,
                            ),
                            child: Icon(
                              [
                                Icons.thumb_up_outlined,
                                Icons.thumb_down_outlined,
                              ][i],
                              color: context.color.onSurface,
                            ),
                          ),
                        const Spacer(),
                        Icon(
                          Icons.bookmark_border_outlined,
                          color: context.color.onSurface,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Shared.value.spacing * 0.5),
                      child: Text(
                        Shared.value.lipsum,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.bodyMedium?.copyWith(
                          color: context.color.onSurface.withOpacity(0.75),
                          fontSize: 12.0,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
