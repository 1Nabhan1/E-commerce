import 'package:ecommerce_beginning/core/constants/image_constants.dart';
import 'package:ecommerce_beginning/core/utils/dimensions.dart';
import 'package:ecommerce_beginning/core/utils/header_widget.dart';
import 'package:ecommerce_beginning/presentation/home_screen/controller/home_controller.dart';
import 'package:ecommerce_beginning/presentation/home_screen/widgets/List_view(1)/list_view_builder.dart';
import 'package:ecommerce_beginning/presentation/home_screen/widgets/List_view/list_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../post(tst).dart';

class Homepage extends GetView<HomeController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 450.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Imageconstants.Homeb), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fashion \nsale',
                      style: GoogleFonts.aclonica(
                          color: Colors.white,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w900),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            fixedSize: Size(140.w, 15.h)),
                        onPressed: () {
                          Get.to(UpdateDataPage());
                        },
                        child: Text(
                          'Check',
                          style: GoogleFonts.aBeeZee(color: Colors.white),
                        ))
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Headerwidget(
                        txt: 'New',
                        clr: Colors.black,
                        fntwgt: FontWeight.w600,
                        size: 30),
                    Headerwidget(
                        txt: "You've never seen it before",
                        clr: Colors.grey,
                        fntwgt: FontWeight.w400,
                        size: 14.sp)
                  ],
                ),
                Headerwidget(
                    txt: 'View all',
                    clr: Colors.black,
                    fntwgt: FontWeight.w300,
                    size: 15.sp)
              ],
            ),
          ),
          SizedBox(height: 240.h, child: const Listviewhome()),
          SizedBox(height: 10.h),
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Imageconstants.Homes), fit: BoxFit.cover),
              ),
              height: 150.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Street clothes',
                        style: GoogleFonts.aclonica(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w900),
                      )
                    ]),
              )),
          Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Headerwidget(
                        txt: 'Sale',
                        clr: Colors.black,
                        fntwgt: FontWeight.w600,
                        size: 30),
                    Headerwidget(
                        txt: "Super summer sale",
                        clr: Colors.grey,
                        fntwgt: FontWeight.w400,
                        size: 14.sp)
                  ],
                ),
                Headerwidget(
                    txt: 'View all',
                    clr: Colors.black,
                    fntwgt: FontWeight.w300,
                    size: 15.sp)
              ],
            ),
          ),
          SizedBox(height: 240.h, child: const Listviewhome1()),
        ]),
      ),
    );
  }
}
