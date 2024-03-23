import 'package:get/get.dart';

import '../Controllers/Otp_controller.dart';

class otpbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpscreenController>(() => OtpscreenController());
  }
}
