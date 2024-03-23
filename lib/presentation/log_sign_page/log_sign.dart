import 'package:ecommerce_beginning/core/constants/image_constants.dart';
import 'package:ecommerce_beginning/presentation/log_sign_page/controller/log_sign_controller.dart';
import 'package:ecommerce_beginning/routes/app_routes.dart';
import 'package:ecommerce_beginning/widgets/ele_button/custom_ele_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignLog extends GetView<LogSignController> {
  const SignLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity.w,
          height: double.infinity.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Imageconstants.SignLog),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                SizedBox(
                  height: 150.h,
                ),
                Text(
                  'Welcome',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent),
                ),
                SizedBox(height: 120.h),
                Custombutton(
                  ontap: () {
                    Get.toNamed(AppRoutes.LogIn);
                  },
                  ele_txt: 'LOGIN',
                ),
                SizedBox(
                  height: 40.h,
                ),
                Custombutton(
                  ele_txt: 'SIGN UP',
                  ontap: () {
                    Get.toNamed(AppRoutes.SignUp);
                  },
                )
              ]),
            ),
          )),
    );
  }
}
