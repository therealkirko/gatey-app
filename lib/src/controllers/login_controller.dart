import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gatey/src/controllers/base_controller.dart';
import 'package:gatey/src/pages/home/index.dart';
import 'package:gatey/src/utilities/dialog_utility.dart';
import 'package:gatey/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController with BaseController {
  var isLoading = false.obs;
  var obscurePassword = true.obs;
  late TextEditingController emailController;
  final storage = const FlutterSecureStorage();
  late TextEditingController passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePassword() {
    if (obscurePassword.value == true) {
      obscurePassword.value = obscurePassword(false);
    } else {
      obscurePassword.value = obscurePassword(true);
    }
  }

  void request() async {
    isLoading(true);
    var email = emailController.text;
    var password = passwordController.text;

    await AuthService().SignIn(email, password).then((value) {
      storeToken(value.token);
      DialogHelper.showSuccessDialog(message: "You have successfully Logged in.");
      Get.to(const HomeScreen());
    }).catchError((error) {
      handleError(error);
    }).whenComplete(() => isLoading(false));
  }

  void storeToken(token) async {
    await storage.write(key: "token", value: token);
  }
}