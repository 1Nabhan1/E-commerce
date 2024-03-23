import 'package:get/get.dart';

import '../controller/log_in_controller.dart';

class Logbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogController>(() => LogController());
  }
}