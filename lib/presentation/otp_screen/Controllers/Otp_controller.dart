import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpscreenController extends GetxController {
  TextEditingController otpController = TextEditingController();

  void onInit() {
    super.onInit();
    _listenForOtp();
  }

  void _listenForOtp() async {
    String? otp = await SmsAutoFill().getAppSignature;
    if (otp != null) {
      // Automatically fill the OTP field
      // otpController.text = otp;
    }
  }
}
