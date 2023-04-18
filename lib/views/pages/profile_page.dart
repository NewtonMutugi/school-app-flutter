import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/services/api.dart';
import 'package:school_app/views/dashboard.dart';
import 'package:school_app/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final dynamic userData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    User currentUser = userData;
    var firstName = userData.firstName;
    var lastName = userData.lastName;
    var email = userData.email;
    print(currentUser);
    return ProfileWidget(
        firstName: "$firstName", lastName: "$lastName", email: "$email");
  }
}

class ProfileWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;

  ProfileWidget(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.email})
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
              'First Name:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              firstName,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const Text(
              'Last Name:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              lastName,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 5.0),
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
            ElevatedButton(
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
