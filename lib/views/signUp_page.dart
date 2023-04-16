import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/services/api.dart';
import 'package:school_app/views/login_page.dart';
import 'package:school_app/views/widgets/custom_widgets.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0XFFD7D6D6),
          body: SingleChildScrollView(
              child: Column(
            children: [
              myAppBar(label: "Sign Up"),
              const SizedBox(
                height: 20,
              ),
              Card(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      myTextField(
                          icon: Icons.person,
                          text: "First Name",
                          controller: firstNameController),
                      myTextField(
                          icon: Icons.person,
                          text: "Last Name",
                          controller: lastNameController),
                      myTextField(
                          icon: Icons.email,
                          text: "Email",
                          controller: emailController),
                      myTextField(
                        icon: Icons.lock,
                        text: "Password",
                        password: true,
                        controller: passwordController,
                      ),
                      myTextField(
                          icon: Icons.lock,
                          text: "Confirm Password",
                          password: true,
                          controller: confirmPasswordController),
                      myButton(
                        label: "Sign Up",
                        action: () => _signUp(),
                      ),
                      myhyperlink(
                        label: "Go back to login",
                        action: () {
                          Get.to(() => LoginPage());
                        },
                        position: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))),
    );
  }

  _signUp() async {
    if (firstNameController.text.isEmpty) {
      Get.snackbar("Error", "First Name is required");
    } else if (lastNameController.text.isEmpty) {
      Get.snackbar("Error", "Last Name is required");
    } else if (emailController.text.isEmpty) {
      Get.snackbar("Error", "Email is required");
    } else if (passwordController.text.isEmpty) {
      Get.snackbar("Error", "Password is required");
    } else if (confirmPasswordController.text.isEmpty) {
      Get.snackbar("Error", "Confirm Password is required");
    } else if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Password does not match");
    } else {
      CircularProgressIndicator();
      dynamic res = await Api.signUp(
          firstNameController.text,
          lastNameController.text,
          emailController.text,
          passwordController.text,
          confirmPasswordController.text);
      if (res['success'] == true) {
        Get.snackbar("Success", "New User Successfully signed up!");
        Get.to(() => LoginPage());
      } else {
        Get.snackbar("Error", res['message']);
      }
    }
  }
}

// void regiterAndSaveUserRecord() async {
//   User userModal = User(
//     myText
//   )
// }

