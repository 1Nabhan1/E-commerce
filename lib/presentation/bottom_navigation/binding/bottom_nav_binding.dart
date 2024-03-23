import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';

class Bottomnavbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavController>(() => BottomnavController());
  }
}
