import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kredit_plus_test/core/config/device.dart';
import 'package:kredit_plus_test/features/list_product/presentation/pages/list_product_page.dart';
import 'package:kredit_plus_test/injector.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  if (kIsWeb) {
    null;
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setMinWindowSize(const Size(600, 450));
  }

  final device = Device();
  device.getDeviceType();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kredit Plus  Technical Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ListProductPage(),
    );
  }
}
