import 'package:flutter/foundation.dart';

class AppSettings {
  static final ValueNotifier<bool> darkModeEnabled = ValueNotifier<bool>(false);
  static final ValueNotifier<bool> privateAccountEnabled = ValueNotifier<bool>(false);

  static void setDarkMode(bool value) {
    darkModeEnabled.value = value;
  }

  static void setPrivateAccount(bool value) {
    privateAccountEnabled.value = value;
  }
}
