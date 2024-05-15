part of '../shared.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.maxWidth,
    this.minHeight,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.child,
  });
  final Widget? child;
  final double? height, minHeight, width, maxWidth;
  final BoxShape shape;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      constraints: BoxConstraints(
        minHeight: minHeight ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
      ),
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: borderRadius,
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

class LoadingBackground extends PaintingEffect {
  const LoadingBackground({
    required super.duration,
    required this.color,
  });

  final Color color;

  @override
  Paint createPaint(
    double t,
    Rect rect,
    TextDirection? textDirection,
  ) {
    return Paint()..color = color;
  }
}
