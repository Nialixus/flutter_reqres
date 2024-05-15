part of '../shared.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.message,
    required this.onReload,
  });
  final String message;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(Shared.value.spacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'OOPS',
            style: context.text.bodyLarge?.copyWith(
              color: context.color.primary,
              fontSize: Shared.value.spacing * 3.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          Flexible(
            child: Container(
              width: context.width,
              constraints: const BoxConstraints(maxWidth: 600.0),
              padding: EdgeInsets.symmetric(
                vertical: Shared.value.spacing,
              ),
              child: SingleChildScrollView(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: context.text.bodyMedium?.copyWith(
                    color: context.color.onSurface.withOpacity(0.75),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
          InkMaterial(
            color: context.color.primary,
            onTap: onReload,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Shared.value.spacing * 2.0,
                vertical: Shared.value.spacing * 0.5,
              ),
              child: Text(
                'Reload',
                style: context.text.bodyMedium?.copyWith(
                  color: context.color.surface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
