import 'package:flutter/material.dart';
import 'package:jplay_flutter/core/theme/theme.dart';

enum SnackBarType { success, information, failure }

class SnackBarWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  SnackBarWidget(this.scaffoldMessengerKey);

  void show(String message, SnackBarType type) {
    Color backgroundColor;
    switch (type) {
      case SnackBarType.success:
        backgroundColor = AppTheme.successColor;
        break;
      case SnackBarType.information:
        backgroundColor = AppTheme.informationColor;
        break;
      case SnackBarType.failure:
        backgroundColor = AppTheme.failureColor;
        break;
    }

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
