import 'package:ecommerce_beginning/presentation/forgot_password/controller/forgot_controller.dart';
import 'package:get/get.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotController>(() => ForgotController());
  }
}
