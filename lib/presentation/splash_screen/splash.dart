import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../core/constants/image_constants.dart';
import 'controller/splash_controller.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade300,
      body: Center(
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Imageconstants.SplashIMG),
                    fit: BoxFit.fitWidth))),
      ),
    );
  }
}
