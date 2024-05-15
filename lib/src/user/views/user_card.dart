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
          height: 200.0,
          width: context.width,
          constraints: const BoxConstraints(maxWidth: 300.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Shared.value.spacing * 0.25),
            boxShadow: [
              BoxShadow(
                offset: Offset(
                  Shared.value.spacing * 0.5,
                  Shared.value.spacing * 0.5,
                ),
                blurRadius: Shared.value.spacing * 0.1,
                color: context.color.onSurface.withOpacity(0.2),
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
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.color.surface,
                      strokeWidth: Shared.value.spacing * 0.25,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: DImage(
                        source: data.avatar,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return Container(
                            alignment: Alignment.center,
                            color: context.color.primary,
                            child: Icon(
                              Icons.broken_image,
                              color: context.color.surface,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Shared.value.spacing,
                        vertical: Shared.value.spacing * 0.5,
                      ),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              context.color.primary,
                              context.color.secondary,
                            ]).createShader,
                        child: Text(
                          data.fullName,
                          style: context.text.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: Shared.value.spacing * 0.5,
                  right: Shared.value.spacing * 0.5,
                  child: InkMaterial(
                    color: Colors.transparent,
                    shapeBorder: const CircleBorder(),
                    onTap: () => launchUrl(
                      Uri(scheme: 'mailto', path: data.email),
                    ),
                    child: GradientBackground(
                      shape: BoxShape.circle,
                      padding: EdgeInsets.all(Shared.value.spacing * 0.75),
                      child: Icon(
                        Icons.mail,
                        size: Shared.value.spacing,
                        color: context.color.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
