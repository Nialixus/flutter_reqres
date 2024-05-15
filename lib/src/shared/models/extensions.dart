part of '../shared.dart';

extension BuildContextExtension on BuildContext {
  ScaffoldMessengerState showSnackbar({
    required DLevel level,
    required String message,
  }) {
    String title;
    ContentType contentType;

    switch (level) {
      case DLevel.error:
        title = 'Error!';
        contentType = ContentType.failure;
        break;
      case DLevel.warning:
        title = 'Warning!';
        contentType = ContentType.warning;
        break;
      default:
        title = 'Info!';
        contentType = ContentType.success;
        break;
    }

    return ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        margin: EdgeInsets.only(
          bottom: height - (150.0 + MediaQuery.of(this).padding.top),
        ),
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      ));
  }
}
