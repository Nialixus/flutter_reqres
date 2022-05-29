import 'package:flutter/material.dart';

String capitalize(String text) {
  try {
    return text
        .split(" ")
        .map((e) => e[0].toUpperCase() + e.substring(1).toLowerCase())
        .join(" ");
  } catch (e) {
    return text;
  }
}

extension Capitalize on String {
  toCaps() => capitalize(this);
}

String colorString(Color color) {
  try {
    return "#${color.value.toRadixString(16).substring(2)}".toUpperCase();
  } catch (e) {
    return color.toString();
  }
}

extension ColorString on Color {
  String asString() => colorString(this);
}
