import 'package:get/get.dart';

import '../controller/Profile_controller.dart';

class Profilebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
