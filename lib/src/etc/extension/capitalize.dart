/// Capitalized [String].
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

/// Capitalized [String] extension.
extension Capitalize on String {
  toCaps() => capitalize(this);
}
