import 'package:get/get.dart';

import '../controller/sign_up_controller.dart';

class Signbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignController>(() => SignController());
  }
}
