import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/views/dashboard.dart';
import 'package:school_app/views/signUp_page.dart';
import 'package:school_app/views/widgets/custom_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
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
                      myTextField(icon: Icons.email, text: "Email"),
                      myTextField(
                        icon: Icons.lock,
                        text: "Password",
                        password: true,
                      ),
                      myhyperlink(
                        label: "Forgot Password?",
                        position: Alignment.centerRight,
                      ),
                      myButton(
                        label: "Login",
                        action: () {
                          Get.offAll(() => Dashboard());
                        },
                      ),
                      myhyperlink(
                        label: "Don't have an account? Sign Up",
                        action: () {
                          Get.to(() => const SignUp());
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
}
