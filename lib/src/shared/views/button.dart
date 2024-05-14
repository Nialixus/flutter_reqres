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
    return GradientBackground(
      margin: margin,
      padding: padding,
      child: TextButton(
        onPressed: onTap,
        child: text != null ? Text(text!) : child,
      ),
    );
  }
}
