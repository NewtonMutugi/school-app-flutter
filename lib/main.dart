import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/routes/routes.dart';
import 'package:school_app/views/splashscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
    );
  }
}
