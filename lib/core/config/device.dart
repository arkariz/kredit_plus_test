import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Device {
  static String? type;
  static String phone = "phone";
  static String tablet = "tablet";

  static bool isPhone() => type == phone;
  static bool isTablet() => type == tablet;

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
    type = data.size.shortestSide < 600 ? phone : tablet;
  }
}
