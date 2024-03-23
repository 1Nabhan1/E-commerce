import 'package:get/get.dart';

import '../controller/Bag_controller.dart';

class Bagbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BagController>(() => BagController());
  }
}
