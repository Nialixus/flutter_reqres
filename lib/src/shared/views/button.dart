part of '../shared.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.padding,
    this.margin,
    required this.onTap,
    required this.child,
  }) : text = null;

  const GradientButton.text({
    super.key,
    this.padding,
    this.margin,
    required this.text,
    required this.onTap,
  })  : child = const Placeholder(),
        assert(text != null);

  final EdgeInsetsGeometry? margin, padding;
  final VoidCallback onTap;
  final String? text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GradientBackground(
        margin: margin,
        borderRadius: BorderRadius.circular(Shared.value.spacing * 0.5),
        child: InkMaterial(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Shared.value.spacing * 0.5),
          color: Colors.transparent,
          splashColor: context.color.onSurface,
          highlightColor: context.color.primary,
          child: Container(
            alignment: Alignment.center,
            padding: padding ?? EdgeInsets.zero,
            child: text != null
                ? Text(
                    text!,
                    style: context.text.bodyMedium?.copyWith(
                      color: context.color.surface,
                    ),
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
