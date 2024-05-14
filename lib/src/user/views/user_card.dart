part of '../user.dart';

class UserCard extends StatelessWidget {
  const UserCard(
    this.data, {
    super.key,
    required this.onTap,
    this.ignore = false,
  });
  final UserCardData data;
  final bool ignore;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Skeleton.ignorePointer(
      ignore: ignore,
      child: InkMaterial(
        onTap: onTap,
        child: Center(
          child: Container(
            height: 200.0,
            width: context.width,
            constraints: const BoxConstraints(maxWidth: 300.0),
            decoration: BoxDecoration(
              color: context.color.surface,
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    Shared.value.spacing * 0.75,
                    Shared.value.spacing * 0.75,
                  ),
                  blurRadius: Shared.value.spacing * 0.5,
                  color: context.color.onSurface.withOpacity(0.5),
                ),
              ],
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: Shared.value.spacing),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    color: context.color.primary,
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
                            color: context.color.surface,
                            child: Icon(
                              Icons.broken_image,
                              color: context.color.primary,
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      color: context.color.surface,
                      padding: EdgeInsets.symmetric(
                        horizontal: Shared.value.spacing,
                        vertical: Shared.value.spacing * 0.5,
                      ),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
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
