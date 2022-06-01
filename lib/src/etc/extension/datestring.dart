/// Convert [DateTime] to [String].
String dateString(DateTime date) {
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Agt",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  return "${date.day}, ${months[date.month - 1]} ${date.year}";
}

/// Convert [DateTime] to [String] extension.
extension DateString on DateTime {
  String asString() => dateString(this);
}
