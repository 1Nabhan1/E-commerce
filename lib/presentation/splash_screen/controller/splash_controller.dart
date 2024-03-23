import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.SignUp);
    });
    super.onInit();
  }
}
