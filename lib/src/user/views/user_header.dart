part of '../user.dart';

class UserHeader extends SliverPersistentHeaderDelegate {
  const UserHeader(this.data, {this.ignore = false});
  final UserData data;
  final bool ignore;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    double percentage = shrinkOffset / maxExtent;

    return Skeleton.ignore(
      ignore: ignore,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.color.surface,
                    context.color.surface.withOpacity(percentage),
                  ],
                ),
              ),
              child: DImage(
                source: data.avatar,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: context.color.primary,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.broken_image,
                    color: context.color.surface,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: kToolbarHeight,
              padding: EdgeInsets.symmetric(
                horizontal: Shared.value.spacing * 0.5,
              ),
              child: Row(
                children: [
                  InkMaterial(
                    onTap: context.pop,
                    shapeBorder: const CircleBorder(),
                    color: context.color.surface,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(Shared.value.spacing * 0.5),
                      child: Icon(
                        Icons.arrow_back,
                        size: Shared.value.spacing,
                        color: context.color.primary,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkMaterial(
                    onTap: () => context.showSnackbar(
                      level: DLevel.warning,
                      message: 'Feature has not been implemented!',
                    ),
                    shapeBorder: const CircleBorder(),
                    color: context.color.surface,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(Shared.value.spacing * 0.5),
                      child: Icon(
                        Icons.more_horiz,
                        size: Shared.value.spacing,
                        color: context.color.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(percentage - 1.0, 1.0 - percentage),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Shared.value.spacing),
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [context.color.primary, context.color.secondary],
                ).createShader,
                child: Text(
                  data.fullName,
                  style: context.text.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 2.0,
                    fontSize: 40.0 - percentage * 24.0,
                    shadows: [
                      Shadow(
                        color: context.color.surface,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 400.0;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate != this;
}
