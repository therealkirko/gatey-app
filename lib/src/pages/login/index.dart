import 'package:flutter/material.dart';
import 'package:gatey/src/controllers/login_controller.dart';
import 'package:gatey/src/pages/home/index.dart';
import 'package:gatey/src/theme/index.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SigninController _controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _controller.emailController,
                  validator: (value) {
                    if(value!.isEmpty || !value.isEmail || !value.contains('@')) {
                      return 'Please provide a valid email address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: textColor,
                      fontSize: 18
                    )
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.passwordController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return 'Please provide a valid email address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: textColor,
                      fontSize: 18
                    ),
                    suffixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 18
                    )
                  ),
                ),
                const SizedBox(height: 30),
                Obx(() => SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: (_controller.isLoading.isTrue)
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(
                        strokeWidth: 4,
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          _controller.request();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}