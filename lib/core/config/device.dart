import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Device {
  static String? type;
  static String phone = "phone";
  static String tablet = "tablet";
  static String web = "web";

  static bool isPhone() => type == phone;
  static bool isTablet() => type == tablet;
  static bool isWeb() => type == web;

  List<DeviceOrientation> phoneRotaion = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];

  List<DeviceOrientation> tabletRotaion = [
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    final shortSide = data.size.shortestSide;
    if (shortSide < 600) {
      type = phone;
    } else if (shortSide > 600 && shortSide <= 700) {}
    type = data.size.shortestSide < 600 ? phone : tablet;
  }
}
