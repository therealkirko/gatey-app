import 'package:flutter/material.dart';
import 'package:gatey/src/controllers/base_controller.dart';
import 'package:gatey/src/services/visit_service.dart';
import 'package:gatey/src/utilities/dialog_utility.dart';
import 'package:get/get.dart';

class VisitController extends GetxController with BaseController {
  var isLoading = false.obs;
  late TextEditingController nationalIdController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController destinationController;

  @override
  void onInit() {
    nationalIdController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    destinationController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nationalIdController.dispose();
    nameController.dispose();
    phoneController.dispose();
    destinationController.dispose();
    super.onClose();
  }

  void request() async {
    isLoading.value = true;
    var nationalId = nationalIdController.text;
    var name = nameController.text;
    var phone = phoneController.text;
    var destination = destinationController.text;

    await VisitService().CreateVisit(nationalId, name, phone, destination).then((value) {
      clearText();
      DialogHelper.showSuccessDialog(message: "You have successfully Logged in.");
    }).catchError((error) {
      handleError(error);
    }).whenComplete(() => isLoading(false));
  }

  void clearText() {
    nationalIdController.clear();
    nameController.clear();
    phoneController.clear();
    destinationController.clear();
  }
}