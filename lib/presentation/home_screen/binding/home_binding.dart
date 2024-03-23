import 'package:get/get.dart';

import '../controller/home_controller.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
