import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/controllers/login_controller.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/services/api.dart';
import 'package:school_app/views/dashboard.dart';
import 'package:school_app/views/signUp_page.dart';
import 'package:school_app/views/widgets/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final CheckboxController controller = Get.put(CheckboxController());

  Future<void> _addSharedPrefs(authToken, id, firstName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', authToken);
    await prefs.setInt('id', id);
    await prefs.setString('first_name', firstName);
  }

  Future<void> _getSharedPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var authToken = preferences.getString('authToken');
    var id = preferences.getInt('id');
    var firstName = preferences.getString('first_name');
    print(authToken);
    print(id);
    print(firstName);
  }

  @override
  Widget build(BuildContext context) {
    _getSharedPrefs();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFD7D6D6),
        body: SingleChildScrollView(
          child: Column(
            children: [
              myAppBar(label: "Hi Student"),
              const SizedBox(
                height: 20,
              ),
              Card(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      myTextField(
                        icon: Icons.email,
                        text: "Email",
                        controller: emailController,
                      ),
                      myTextField(
                        controller: passwordController,
                        icon: Icons.lock,
                        text: "Password",
                        password: true,
                      ),
                      const SizedBox(),
                      const SizedBox(),
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() => CheckboxListTile(
                              title: const Text("Remember me"),
                              value: controller.isChecked.value,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                controller.toggleCheckbox(value!);
                              },
                              checkboxShape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0.5))),
                            )),
                      ),
                      myhyperlink(
                        label: "Forgot Password?",
                        position: Alignment.centerRight,
                      ),
                      myButton(label: "Login", action: () => loginFunction()),
                      myhyperlink(
                        label: "Don't have an account? Sign Up",
                        action: () {
                          Get.to(() => SignUp());
                        },
                        position: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginFunction() async {
    if (passwordController.text.isEmpty && emailController.text.isEmpty) {
      Get.snackbar("Error", "Provide Email and Password");
      return;
    } else if (passwordController.text.isEmpty) {
      Get.snackbar("Error", "Provide Password");
      return;
    } else if (emailController.text.isEmpty) {
      //call sigin function
      Get.snackbar("Error", "Provide Email");
      return;
    } else {
      CircularProgressIndicator();
      dynamic res =
          await Api.login(emailController.text, passwordController.text);

      print(res);
      if (res['success'] == true) {
        var authToken = res['authToken'];
        var first_name = res['first_name'];
        var user_id = res['user_id'];
        print(first_name);
        print(user_id);

        if (controller.isChecked.value == true) {
          _addSharedPrefs(authToken, user_id, first_name);
        }
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setString('authToken', authToken);
        // prefs.setString('id', user_id);
        // prefs.setString('first_name', first_name);
        // await prefs.save();

        // prefs.setString('last_name', res['last_name']);

        User currentUser = User(
          id: res['user_id'],
          firstName: res['first_name'],
          lastName: res['last_name'],
          email: res['email'],
          authenticationToken: res['authToken'],
        );

        Get.snackbar("Login Successful", "Welcome $first_name!");
        Get.offAll(() => Dashboard(), arguments: currentUser);
      } else {
        Get.snackbar("Error", "Invalid Email or Password");
      }
    }
  }

  // final API api = API();

  // Future<String> signIn(String email, String password) async {
  //   try {
  //     var data = {
  //       'user': {'email': email, 'password': password}
  //     };
  //     var response = await API.login('/login', data);
  //     String token = response['token'];
  //     return token;
  //   } catch (e) {
  //     throw Exception('Failed to sign in');
  //   }
  // }
}
