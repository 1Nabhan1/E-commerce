import 'package:ecommerce_beginning/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombutton extends StatelessWidget {
  final String ele_txt;
  final void Function()? ontap;

  const Custombutton({super.key, required this.ele_txt, this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE)),
            fixedSize: Size(320.w, 43.h)),
        onPressed: ontap,
        child: Text(
          ele_txt,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
