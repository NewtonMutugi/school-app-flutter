import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/services/api.dart';
import 'package:school_app/views/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  Future<void> loginUser() async {
    isLoading.value = true;
    errorMessage.value = '';

    final email = emailController.text;
    final password = passwordController.text;

    final response = await Api.login(email, password);

    isLoading.value = false;

    if (response['success']) {
      final authToken = response['authToken'];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('authToken', authToken);

      Get.offNamed('/home');
    } else {
      errorMessage.value = response['message'];
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    errorMessage.value = '';

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

      dynamic res =
          await Api.login(emailController.text, passwordController.text);
      isLoading.value = false;
      print(res);
      if (res['success']) {
        final authToken = res['token'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('authToken', authToken);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
        prefs.setString('userId', res['userId']);
        prefs.setString('first_name', res['first_name']);
        prefs.setString('last_name', res['last_name']);
        Get.snackbar("Login Successful", "Welcome ${res['first_name']}!");
        Get.offAll(() => Dashboard());
      } else {
        Get.snackbar("Error", "Invalid Email or Password");
        var response;
        errorMessage.value = response['message'];
      }
    }
  }
}
class CheckboxController extends GetxController {
  var isChecked = false.obs;

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }
}
