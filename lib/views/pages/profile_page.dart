import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:school_app/services/api.dart';
import 'package:school_app/views/dashboard.dart';
import 'package:school_app/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileWidget(name: "Newton Mutugi", email: "newff");
  }
}

class ProfileWidget extends StatelessWidget {
  final String name;
  final String email;

  ProfileWidget({Key? key, required this.name, required this.email})
      : super(key: key);

  var authtoken = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0),
            const Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              email,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            FloatingActionButton(
              onPressed: () => logout(),
              child: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }

  logout() async {
    // final prefs = await SharedPreferences.getInstance();
    // authtoken = prefs.getString('authToken')!;
    print(authtoken);

    var response = await Api.logout(authtoken);

    if (response['success'] = true) {
      Get.snackbar("Logout Successful", "Finished");
      Get.offAll(() => LoginPage());
    } else {
      Get.snackbar("Login Failed", "Please try again");
    }
  }
}
