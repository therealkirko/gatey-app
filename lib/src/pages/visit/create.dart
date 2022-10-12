import 'package:flutter/cupertino.dart';
import 'package:gatey/src/controllers/visits_controller.dart';
import 'package:gatey/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateVisitScreen extends StatelessWidget {
  CreateVisitScreen({Key? key}) : super(key: key);
  final VisitController _controller = Get.put(VisitController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: textColor,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _controller.nationalIdController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Please provide a valid visitor's national ID";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'National Id',
                    labelStyle: TextStyle(
                      color: textColor,
                      fontSize: 18
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.nameController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Please provide the visitor's name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                    labelStyle: TextStyle(
                      color: textColor,
                      fontSize: 18
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.phoneController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Please provide the visitor's phone number";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    labelStyle: TextStyle(
                      color: textColor,
                      fontSize: 18
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.destinationController,
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Please provide the visitor's destination office";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Office',
                    labelStyle: TextStyle(
                      color: textColor,
                      fontSize: 18
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                        'Continue',
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