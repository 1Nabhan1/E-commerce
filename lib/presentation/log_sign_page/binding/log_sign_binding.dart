import 'package:get/get.dart';

import '../controller/log_sign_controller.dart';

class LogSignbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogSignController>(() => LogSignController());
  }
}
