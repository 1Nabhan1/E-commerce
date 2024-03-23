import 'package:ecommerce_beginning/core/constants/image_constants.dart';
import 'package:ecommerce_beginning/core/utils/dimensions.dart';
import 'package:ecommerce_beginning/core/utils/font_size.dart';
import 'package:ecommerce_beginning/core/utils/header_widget.dart';
import 'package:ecommerce_beginning/routes/app_routes.dart';
import 'package:ecommerce_beginning/widgets/ele_button/custom_ele_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar/custom_appbar.dart';
import '../../widgets/text_field/custom_field.dart';
import 'controller/sign_up_controller.dart';

class SignUp extends GetView<SignController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        action: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.Bottomnav);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            Imageconstants.Apbarback,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_LARGE,
                      vertical: Dimensions.PADDING_SIZE_SMALL),
                  child: Headerwidget(
                      txt: 'Sign Up',
                      clr: Colors.black,
                      fntwgt: FontWeight.w600,
                      size: Dimensions.fontSizeDoubleOverLarge),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_SMALL,
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Obx(
                () => Customtextfield(
                  control: controller.userNameControl,
                  keyboerd_type: TextInputType.name,
                  onChanged: (value) {
                    controller.validateName(value);
                  },
                  validator: (value) {
                    RegExp regex =
                        new RegExp(r'^.{3,}$'); //entering minimum value 3
                    if (value!.isEmpty) {
                      return ("User Name Is Required");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid User Name (Min. 3 Characters)");
                    }
                    return null;
                  },
                  on_saved: (value) {
                    controller.userNameControl.text = value!;
                  },
                  lbtxt: 'Name',
                  fcclr: Colors.blue,
                  txtinputact: TextInputAction.next,
                  bdr_radius: 10,
                  suffix: controller.isNameValid.isTrue
                      ? const Icon(
                          Icons.task_alt,
                          color: Colors.green,
                        )
                      : null,
                  obscureText: false,
                  isvalid: controller.isNameValid.value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_SMALL,
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Obx(
                () => Customtextfield(
                  control: controller.emailAddressControl,
                  keyboerd_type: TextInputType.emailAddress,
                  validmode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    //reg exression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@gmail.com")
                        .hasMatch(value)) {
                      return ("Please Enter valid Email");
                    }
                    return null;
                  },
                  on_saved: (value) {
                    controller.emailAddressControl.text = value!;
                  },
                  onChanged: (value) {
                    controller.validateEmail(value);
                  },
                  txtinputact: TextInputAction.next,
                  lbtxt: 'E-Mail',
                  fcclr: Colors.blue,
                  bdr_radius: 10,
                  suffix: controller.isEmailValid.isTrue
                      ? const Icon(
                          Icons.task_alt,
                          color: Colors.green,
                        )
                      : null,
                  obscureText: false,
                  isvalid: controller.isEmailValid.value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.PADDING_SIZE_SMALL,
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Obx(
                () => Customtextfield(
                  control: controller.passwordControl,
                  validmode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    RegExp regex =
                        new RegExp(r'^.{6,}$'); //entering minimum value 6
                    if (value!.isEmpty) {
                      return ("Password Is Required");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password (Min. 6 Characters)");
                    }
                  },
                  on_saved: (value) {
                    controller.passwordControl.text = value!;
                  },
                  txtinputact: TextInputAction.next,
                  onChanged: (value) {
                    controller.validatePassword(value);
                  },
                  lbtxt: 'Password',
                  suffix: GestureDetector(
                    onTap: () {
                      controller.obscureText.value =
                          !controller.obscureText.value;
                    },
                    child: Icon(
                      controller.obscureText.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: Colors.redAccent,
                    ),
                  ),
                  fcclr: Colors.blue,
                  bdr_radius: 10,
                  obscureText: controller.obscureText.value,
                  isvalid: controller.isPasswordValid.value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: Dimensions.PADDING_SIZE_DEFAULT,
                  top: Dimensions.PADDING_SIZE_DEFAULT),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.LogIn);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Already have an account?',
                        style: Fontstyle.Default_txt),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Custombutton(
              ele_txt: 'SIGN UP',
              ontap: () {
                controller.signUp(controller.emailAddressControl.text,
                    controller.passwordControl.text);
              },
            ),
            SizedBox(
              height: 70.h,
            ),
            Center(
              child: Text("Or sign up with social account",
                  style: Fontstyle.Default_txt),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.signInWithGoogle();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                blurStyle: BlurStyle.normal)
                          ],
                          color: Colors.blueGrey.shade300,
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_LARGE)),
                      height: 50.h,
                      width: 80.w,
                      child: Padding(
                        padding: const EdgeInsets.all(
                            Dimensions.PADDING_SIZE_DEFAULT),
                        child: Image.asset(
                          Imageconstants.Google,
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    controller.signInWithFacebook();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              blurStyle: BlurStyle.normal)
                        ],
                        color: Colors.blueGrey.shade300,
                        borderRadius:
                            BorderRadius.circular(Dimensions.RADIUS_LARGE)),
                    height: 50.h,
                    width: 80.w,
                    child: Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      child: Image.asset(
                        Imageconstants.Facebook,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
