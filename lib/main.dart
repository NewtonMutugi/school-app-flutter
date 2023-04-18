import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/config/colors.dart';
import 'package:school_app/routes/routes.dart';
import 'package:school_app/services/api_service.dart';
import 'package:school_app/views/splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_app/controllers/task_controller.dart';

void main() {
  Get.put(TasksController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light().copyWith(
      //   //scaffoldBackgroundColor: Colors.blueGrey[200],
      //   textTheme: GoogleFonts.sourceSansProTextTheme()
      //   ),
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
    );
  }
}
