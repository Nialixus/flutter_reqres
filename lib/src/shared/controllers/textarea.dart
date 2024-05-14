part of '../shared.dart';

class TextAreaController extends TextEditingController {
  TextAreaController({
    super.text,
    bool obscure = false,
  }) : _obscure = obscure;

  final FocusNode focusNode = FocusNode();

  bool _obscure;
  bool get obscure => _obscure;
  set obscure(bool obscure) {
    _obscure = obscure;
    notifyListeners();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
