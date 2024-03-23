import 'package:ecommerce_beginning/core/constants/image_constants.dart';
import 'package:ecommerce_beginning/core/utils/dimensions.dart';
import 'package:ecommerce_beginning/core/utils/font_size.dart';
import 'package:ecommerce_beginning/core/utils/header_widget.dart';
import 'package:ecommerce_beginning/presentation/otp_screen/Otp_screen.dart';
import 'package:ecommerce_beginning/widgets/app_bar/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/ele_button/custom_ele_button.dart';
import '../../widgets/text_field/custom_field.dart';
import 'controller/forgot_controller.dart';

class Forgotpassword extends GetView<ForgotController> {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppbar(
          title: '',
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset(Imageconstants.Apbarback)),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE,
                  vertical: Dimensions.PADDING_SIZE_SMALL),
              child: Headerwidget(
                  txt: 'Forgot password',
                  clr: Colors.black,
                  fntwgt: FontWeight.w600,
                  size: Dimensions.fontSizeDoubleOverLarge),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          child: Text(
              'Please, enter your Phone number. You will recieve a link to create a new password',
              style: Fontstyle.Default_txt),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Dimensions.PADDING_SIZE_SMALL,
              horizontal: Dimensions.PADDING_SIZE_LARGE),
          child: Obx(
            () => Customtextfield(
              pretxt: '+91',
              keyboerd_type: TextInputType.number,
              control: controller.phonecontrol,
              validmode: AutovalidateMode.onUserInteraction,
              validator: (value) => controller.Validatephone(value!),
              onChanged: (value) {
                controller.validatePhone(value);
              },
              lbtxt: 'Enter Phone',
              fcclr: Colors.blue,
              bdr_radius: 10,
              suffix: controller.showcloseicon.value
                  ? IconButton(
                      onPressed: () {
                        controller.phonecontrol.clear();
                      },
                      icon: const Icon(Icons.close))
                  : null,
              obscureText: false,
              isvalid: controller.isEmailValid.value,
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Custombutton(
          ele_txt: 'SEND',
          ontap: () async {
            await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException ex) {},
                codeSent: (String verificationid, int? resendtoken) {
                  Get.to(Otpscreen(verificationid: verificationid));
                },
                codeAutoRetrievalTimeout: (String verificationid) {},
                phoneNumber: " +91${controller.phonecontrol.text.toString()}");
          },
        ),
      ]),
    );
  }
}
