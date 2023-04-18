import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/views/pages/home_page.dart';
import 'package:school_app/views/pages/profile_page.dart';
import 'package:school_app/views/pages/tasks_page.dart';
import 'package:school_app/views/pages/units_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {
  final List<String> _titles = ['Home', 'Tasks', 'Units', 'Profile'];

  final List<Widget> _screens = [
    HomePage(),
    TasksPage(),
    UnitsPage(),
    ProfilePage()
  ];
  final _selectedIndex = 0.obs;

  _getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('id');
    var firstName = prefs.getString('first_name');
    var lastName = prefs.getString('last_name');
    var authToken = prefs.getString('authToken');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => _screens[_selectedIndex.value]),
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                svgPath: "assets/images/home.svg",
                backgroundColor: Color(0xFF4285F4)),
            FluidNavBarIcon(
                svgPath: "assets/images/tasks.svg",
                backgroundColor: Color(0xFFFCBA02)),
            FluidNavBarIcon(
                svgPath: "assets/images/units.svg",
                backgroundColor: Color(0xFFEC4134)),
            FluidNavBarIcon(
                svgPath: "assets/images/profile.svg",
                backgroundColor: Color(0xFF34A950)),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(
              iconUnselectedForegroundColor: const Color(0XFF36393B),
              barBackgroundColor: Colors.blue.withOpacity(0.5)),
        ));
  }

  void _handleNavigationChange(int selectedIndex) {
    _selectedIndex.value = selectedIndex;
  }
}

