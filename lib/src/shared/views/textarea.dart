part of '../shared.dart';

class TextArea extends StatelessWidget {
  const TextArea({
    super.key,
    this.margin,
    this.padding,
    this.hint,
    this.label,
    this.onSubmitted,
    this.obscure = false,
    required this.controller,
  });
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextAreaController controller;
  final void Function(String value)? onSubmitted;
  final bool obscure;
  final String? hint;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: context.color.primary.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: context.color.secondary,
          ),
        ),
      ),
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, state) {
          return TextFormField(
            controller: controller,
            focusNode: controller.focusNode,
            obscureText: obscure && controller.obscure,
            obscuringCharacter: '•',
            onFieldSubmitted: onSubmitted,
            decoration: InputDecoration(
              suffix: obscure
                  ? InkMaterial(
                      color: Colors.transparent,
                      onTap: () => controller.obscure = !controller.obscure,
                      child: Icon(controller.obscure
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )
                  : null,
              hintText: hint,
              labelText: label,
              labelStyle: context.text.bodyMedium?.copyWith(
                color: context.color.primary,
              ),
              border: InputBorder.none,
            ),
          );
        },
      ),
    );
  }
}
