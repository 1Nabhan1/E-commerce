import 'package:get/get.dart';

import '../controller/Shop_controller.dart';

class Shopbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(() => ShopController());
  }
}
