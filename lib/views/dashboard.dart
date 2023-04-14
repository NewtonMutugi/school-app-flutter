import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/views/pages/home_page.dart';
import 'package:school_app/views/pages/profile_page.dart';
import 'package:school_app/views/pages/tasks_page.dart';
import 'package:school_app/views/pages/units_page.dart';

class Dashboard extends StatelessWidget {
  final List<String> _titles = ['Home', 'Units', 'Tasks', 'Profile'];

  final List<Widget> _screens = [
    HomePage(),
    UnitsPage(),
    TasksPage(),
    ProfilePage()
  ];
  final _selectedIndex = 0.obs;

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
                svgPath: "assets/images/units.svg",
                backgroundColor: Color(0xFFEC4134)),
            FluidNavBarIcon(
                svgPath: "assets/images/tasks.svg",
                backgroundColor: Color(0xFFFCBA02)),
            FluidNavBarIcon(
                svgPath: "assets/images/profile.svg",
                backgroundColor: Color(0xFF34A950)),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white)),
    );
  }

  void _handleNavigationChange(int selectedIndex) {
    _selectedIndex.value = selectedIndex;
  }
}

// BottomNavigationBar(
//         currentIndex: _selectedIndex.value,
//         onTap: (index) {
//           _selectedIndex.value = index;
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Units',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.grade),
//             label: 'Exam',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.prof),
//             label: 'Profile',
//           ),
//         ],
//       ),
