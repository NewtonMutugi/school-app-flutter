import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/views/login_page.dart';
import 'package:school_app/views/widgets/custom_widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                      myTextField(icon: Icons.person, text: "Name"),
                      myTextField(icon: Icons.email, text: "Email"),
                      myTextField(
                          icon: Icons.lock, text: "Password", password: true),
                      myTextField(
                          icon: Icons.lock,
                          text: "Confirm Password",
                          password: true),
                      myButton(
                        label: "Sign Up",
                        action: () {
                          //regiterAndSaveUserRecord();
                          //Get.offAll(() => Dashboard());
                        },
                      ),
                      myhyperlink(
                        label: "Go back to login",
                        action: () {
                          Get.to(() => const LoginPage());
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
}

// void regiterAndSaveUserRecord() async {
//   User userModal = User(
//     myText
//   )
// }
