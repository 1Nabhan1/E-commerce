import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  var isEmailValid = false.obs;
  TextEditingController phonecontrol = TextEditingController();
  TextEditingController controllers = TextEditingController();
  RxBool showcloseicon = true.obs;

  void validatePhone(String value) {
    isEmailValid.value = value.isNotEmpty;
  }

  String? Validatephone(String value) {
    if (value.length == 10 && int.tryParse(value) != null) {
      return null;
    }
    return 'Phone number must be a 10-digit number';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phonecontrol.addListener(() {
      showcloseicon.value = phonecontrol.text.isNotEmpty;
    });
  }
}
