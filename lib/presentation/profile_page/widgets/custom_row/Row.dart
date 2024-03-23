import 'package:ecommerce_beginning/presentation/profile_page/controller/Profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';

class Customrow extends StatelessWidget {
  const Customrow({Key? key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            Icons.person_add_alt_rounded,
            size: 50,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${profileController.loggedInUser.userName.obs}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text("${profileController.loggedInUser.emailAddress.obs}"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
