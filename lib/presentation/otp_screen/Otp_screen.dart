import 'dart:developer';

import 'package:ecommerce_beginning/presentation/otp_screen/Controllers/Otp_controller.dart';
import 'package:ecommerce_beginning/routes/app_routes.dart';
import 'package:ecommerce_beginning/widgets/app_bar/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/utils/dimensions.dart';
import '../../core/utils/header_widget.dart';
import '../../widgets/ele_button/custom_ele_button.dart';

class Otpscreen extends GetView<OtpscreenController> {
  String verificationid;

  Otpscreen({super.key, required this.verificationid});

  @override
  Widget build(BuildContext context) {
    final OtpscreenController otpscreenController =
        Get.put(OtpscreenController());
    return Scaffold(
      appBar: CustomAppbar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_sharp)),
      ),
      body: Column(children: [
        Headerwidget(
            txt: 'Enter Otp',
            clr: Colors.black,
            fntwgt: FontWeight.w600,
            size: Dimensions.fontSizeDoubleOverLarge),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE,
              vertical: Dimensions.PADDING_SIZE_SMALL),
          child: PinCodeTextField(
            pinTheme: PinTheme.defaults(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 60,
                fieldWidth: 50),
            autoFocus: true,
            keyboardType: TextInputType.number,
            appContext: context,
            length: 6,
            controller: otpscreenController.otpController,
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Custombutton(
          ele_txt: 'VERIFY',
          ontap: () async {
            try {
              PhoneAuthCredential credential =
                  await PhoneAuthProvider.credential(
                      verificationId: verificationid,
                      smsCode:
                          otpscreenController.otpController.text.toString());
              FirebaseAuth.instance
                  .signInWithCredential(credential)
                  .then((value) {
                Get.toNamed(AppRoutes.Bottomnav);
              });
            } catch (ex) {
              log(ex.toString());
            }
          },
        ),
      ]),
    );
  }
}
