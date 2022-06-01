import 'package:flutter/material.dart';

/// Convert [Color] to [String].
String colorString(Color color) {
  try {
    return "#${color.value.toRadixString(16).substring(2)}".toUpperCase();
  } catch (e) {
    return color.toString();
  }
}

/// Convert [Color] to [String] extension.
extension ColorString on Color {
  String asString() => colorString(this);
}
