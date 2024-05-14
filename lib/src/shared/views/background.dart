part of '../shared.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    this.margin,
    this.padding,
    this.height,
    this.minHeight,
    this.child,
  });
  final Widget? child;
  final double? height, minHeight;
  final EdgeInsetsGeometry? margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      constraints: BoxConstraints(
        minHeight: minHeight ?? 0.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.color.primary,
            context.color.secondary,
          ],
        ),
      ),
      child: child,
    );
  }
}
